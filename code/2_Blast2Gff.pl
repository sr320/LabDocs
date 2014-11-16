#!/usr/bin/perl -w
#-----------------------------------------------------------+
#                                                           | 
# Blast2Gff.pl                                              |
#                                                           |
#-----------------------------------------------------------+
#  AUTHOR: James C. Estill                                  |
# CONTACT: JamesEstill_at_gmail.com                         |
# STARTED: 04/17/2007                                       |
# UPDATED: 04/18/2007                                       |
# DESCRIPTION:                                              |
#  Converts BLAST output to GFF format. This the the GFF    |
#  format that is used with the Apollo Genome Annotation    |
#  curation program.                                        |
#  Currently this only works with m8 blast output.          |
#               
# modified by Steven Roberts
# Modified to work when doing a "reverse" blast. In other words the sequence ID is the Subject as opposed to the Query.
# Also modifed so score field displays e-value as opposed to bit score.                                            |
#-----------------------------------------------------------+

=head1 INCLDUES
=cut
#-----------------------------+
# INCLUDES                    |
#-----------------------------+
use strict;                   # Keeps thing running clean
use Getopt::Std;              # Get options from command line

=head1 VARIABLES
=cut
#-----------------------------+
# VARIABLES                   |
#-----------------------------+
my $GffAppend;                 # BOOLEAN. Append to GFF file
my $InFile;                    # Full path to the input blast output file
my $OutFile;                   # Full path to the gff formatted output file
my $AlignFormat;               # Alignment format of the blast output file
                               # ie. -m = 0,8, or 9
my $PrintHelp;                 # Boolean, print the Usage statement
my $BlastDb;                   # Blast database 
my $BlastProg;                 # Blast program (ie. blastn, blastx
my $SeqName;                   # Name of the sequence file used for query

my $Usage = "USAGE:\n".
    "Blast2Gff.pl -i InFile.Fasta -o OutFile.gff -d BlastDb\n".
    " -p blastprogram -m AligFormat -s SeqName -a\n\n".
    " -i Full path to the BLAST output file[STRING]\n".
    " -o Full path for the GFF formated file [STRING]\n".
    "    Default is the intput file path with gff extension.\n".
    " -d Blast database that was blasted against [STRING]\n".
    "    This is required\n".
    " -s ".
    " -m Format of the algnment outout from blast [INTEGER]\n".
    "    Default value is 8. Valid values are 0,8,9".
    " -p Blast program used [STRING]\n".
    "    Default is blastn\n".
    " -a Append results to the gff file [BOOLEAN]\n".
    "    Default is to overwrite any exiting file.\n".
    " -h Print this help statement [BOOLEAN]\n";

=head1 COMMAND LINE VARIABLES
=cut
#-----------------------------+
# COMMAND LINE VARIABLES      |
#-----------------------------+
my %Options;
getopts('d:i:o:m:p:s:ha', \%Options);

$PrintHelp = $Options{h};
if ($PrintHelp)
{
    print $Usage;
    exit;
}

$SeqName = $Options{s} ||
    die "\aERROR: A sequence file name must be specified\n$Usage\n";
$GffAppend = $Options{a};
$InFile = $Options{i} ||
    die "\aERROR: An input file must be specified.\n\n$Usage\n";
# Default output is the full path of the input file with the gff extension
$BlastProg = $Options{p} ||
    "blastn";
$BlastDb = $Options{d} || 
    die "\aERROR: A blast database should be indicated.\n\n$Usage\n";
$OutFile = $Options{o} ||
    $InFile.".gff";
$AlignFormat = $Options{m} || 
    "8";                        # Default format is tab delim

#-----------------------------+
# CHECK FILE EXISTENCE        |
#-----------------------------+
unless (-e $InFile)
{
    print "The input file could not be found\n$InFile\n";
    exit;
}

#-----------------------------+
# CONVERT BLAST FILE TO GFF   |
#-----------------------------+
# Test Blast2Gff subfunction

if ($AlignFormat == "8")
{
    &TabBlast2Gff ($InFile, $OutFile, $BlastDb, $SeqName, "blastn");
} else {
    print "A valid BLAST alignment format was not selected.\n";
}


#-----------------------------------------------------------+
# SUBFUNCTIONS                                              |
#-----------------------------------------------------------+

sub TabBlast2Gff 
{
    my $In = $_[0];       # Path to blast intput file
    my $Out = $_[1];      # Path to gff output file
    my $Db = $_[2];       # The BLAST databas the hits are derived from
    my $Name = $_[3];     # Seqname
    my $Prog = $_[4];     # BLAST program used
    my $GStart;           # GFF Start position 
    my $GEnd;             # GFF End position

#    my $Format = $_[4];   # Format of the blast file
#                          # 8,9, 0 etc
#    my $UseScore = $_[5]; # Score format to use
    
    my $HitNum = "0";
    #-----------------------------+
    # FILE I/O                    |
    #-----------------------------+
    open (BLASTIN, "<".$In) ||
	die "Can not open BLAST input file.$In.\n";
    
    # If append was selected, just append gff data to the
    # output file
    if ($GffAppend)
    {
	open (GFFOUT, ">>".$Out) ||
	    die "Can not open GFF ouput file.$Out.\n";
    } else {
	open (GFFOUT, ">".$Out) ||
	    die "Can not open GFF ouput file.$Out.\n";
    }    

    while (<BLASTIN>)
    {
	$HitNum++;
   
	my ($QryId, $SubId, $PID, $Len, 
	    $MisMatch, $GapOpen, 
	    $QStart,$QEnd, $SStart, $SEnd,
	    $EVal, $BitScore) = split(/\t/);
	
	my $Strand;
	my $Frame = ".";
	
	# Set the start to be less then the end
	# This info can be used to dedeuct the strand
	# sr320: modifying below to focus on S for using when blast changes direction
	# sr320 changed all Q to S
	if ($SStart < $SEnd)
	{
	    $GStart = $SStart;
	    $GEnd = $SEnd;
	    $Strand = "+";
	} elsif ($SStart > $SEnd) {
	    $GStart = $SStart;
	    $GEnd = $SEnd;
	    $Strand = "-";
	} else {
	    die "Unexpected Query Start and End:\n\tS:$QStart\n\tE:$QEnd";
	}
	
	# Trim leading white space from Bit score
	$BitScore =~ s/^\s*(.*?)\s*$/$1/;
	
	# Currently working with this to get it to draw
	# the items as separate items
	print GFFOUT 
	    # I initially used the following
	    # sr320 rearranging for reverse blast (going in other direction)
	    # sr320 changed to output evalue instead of bit score
#	    $Name."\t".   # SeqName
	    $SubId."\t".
#		$QryId."\t".
	    $Prog.":".$Db."\t".    # Source (BLAST PROGRAM)
#	    $Prog.":".$Db."\t".    # Feature (Database)
#	    $SubId."\t".           # Feature (Database)
	    $Prog."\t".           # Feature (Database)
	    $GStart."\t".          # Start
	    $GEnd."\t".            # End
	    $EVal."\t".			   # evalue
#	    $BitScore."\t".        # Score
	    $Strand."\t".          # Strand
	    $Frame."\t".           # Frame
	    $QryId."\t".
#	    $SubId.                # Attribute
	    "\n";
	
    } # END OF WHILE BLASTIN
    
} # END OF Blast2Gff Subfunction


#-----------------------------------------------------------+
# PROGRAM STARTED
#-----------------------------------------------------------+
# 04/17/2007
# - Program started
# - Started Blast2Gff subfunction with tab delim format
# 
# 04/18/2007
# - Adding command line options
# - Working on Blast2Gff tab delim format