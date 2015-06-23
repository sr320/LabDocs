#!/bin/sh

#Shell script to backup lab notebooks hosted on blogspot.com and onsnetwork.org
#for offline viewing

#Set variables with today's date and append notebook owner name.
JAKE_NOTEBOOK=$(date '+%Y%m%d')_jake
JAY_NOTEBOOK=$(date '+%Y%m%d')_jay
SAM_NOTEBOOK=$(date '+%Y%m%d')_sam
STEVEN_NOTEBOOK=$(date '+%Y%m%d')_steven

#Change to Jake's notebok backups folder
cd /volume1/Archive/notebooks/jake

#Download website with all necessary files for offline viewing.
#Reject possibly large files (.zip, .gz, .fastq, .fasta, .fa, .bam/sam, .gtf/gff, etc.)
wget --user-agent mozilla --adjust-extension --mirror --span-hosts --convert-links \
--page-requisites \
--reject *.[BbSs][Aa][Mm],*.[Ff][Aa]*,*.zip,*.gz,*.[Tt][Aa][Bb]*,*.txt,*.[Gg]*[Ff],*.goa*,*.interval \
--no-parent -e robots=off \
--wait=1 --random-wait --limit-rate=100m \
--domains=blogspot.com,eagle.fish.washington.edu,docs.google.com \
http://heareresearch.blogspot.com/

#Create gzip tarball of all downloaded files; uncomment if tarball gzip desired.
#tar -cvzf $JAKE_NOTEBOOK.tar.gz .

#Change to Jay's notebook backups folder
cd /volume1/Archive/notebooks/jay

#Download website with all necessary files for offline viewing.
#Reject possibly large files (.zip, .gz, .fastq, .fasta, .fa, .bam/sam, .gtf/gff, etc.)
wget --user-agent mozilla --adjust-extension --mirror --span-hosts --convert-links \
--page-requisites \
--reject *.[BbSs][Aa][Mm],*.[Ff][Aa]*,*.zip,*.gz,*.[Tt][Aa][Bb]*,*.txt,*.[Gg]*[Ff],*.goa*,*.interval \
--no-parent -e robots=off \
--wait=1 --random-wait --limit-rate=100m \
--domains=onsnetwork.org,eagle.fish.washington.edu,docs.google.com \
http://onsnetwork.org/jdimond/

##Change to Sam's notebook backups folder
cd /volume1/Archive/notebooks/sam

#Download website with all necessary files for offline viewing.
#Reject possibly large files (.zip, .gz, .fastq, .fasta, .fa, .bam/sam, .gtf/gff, etc.)
wget --user-agent mozilla --adjust-extension --mirror --span-hosts --convert-links \
--page-requisites \
--reject *.[BbSs][Aa][Mm],*.[Ff][Aa]*,*.zip,*.gz,*.[Tt][Aa][Bb]*,*.txt,*.[Gg]*[Ff],*.goa*,*.interval \
--no-parent -e robots=off --wait=1 --random-wait --limit-rate=100m \
--domains=onsnetwork.org,eagle.fish.washington.edu,docs.google.com \
http://onsnetwork.org/kubu4/

#Change to Steven's notebook backups folder
cd /volume1/Archive/notebooks/steven

#Download website with all necessary files for offline viewing.
#Reject possibly large files (.zip, .gz, .fastq, .fasta, .fa, .bam/sam, .gtf/gff, etc.)
wget --user-agent mozilla --adjust-extension --mirror --span-hosts --convert-links \
--page-requisites \
--reject *.[BbSs][Aa][Mm],*.*[Ff][Aa]*,*.zip,*.gz,*.[Tt][Aa][BbRr]*,*.txt,\
*.[Gg]*[Ff]*,*.goa*,*.interval,*.enex,*[Ss]oap*,*.tgz,*.[np]hr,*.[np]sq,*.[np]sd,
*.[np]in,*.[np]nd,*.[np]in,*.[np]hd,*.[np]pd,*[np]og,*.[np]hi,*.[np]ni,*.[np]si,
*.[np]in,*.msk,*.[Qq][Uu][Aa][Ll],swissprot*,methratio*,*.[Bb][Ss][Pp],*.[Ff][Qq],
gp_association_goa_uniprot_2,BiGoRNA_CLCtrim_adp5,CGmotif_intersect_feature,
BiGoRNASeq_noMap,test_adp,*.[Bb][Ee][Dd]*,*.edge,bbd44e69cb8906b53daf33e308b70cb5 \
--no-parent \
-e robots=off --wait=1 --random-wait --limit-rate=100m \
--domains=onsnetwork.org,eagle.fish.washington.edu,docs.google.com \
http://onsnetwork.org/halfshell/
