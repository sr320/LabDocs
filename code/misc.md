#misc 

Restarting CLC Server (bigfish)

```
cd /Volumes/bigfishRAID/common/CLCGenomicsServer
./CLCGenomicsServer status
./CLCGenomicsServer start
./CLCGenomicsServer status
```

---

###Directory listing of all files in a folder on a website
Add a file called ".htaccess" to any directory where a public directory listing is desired. To the .htaccess file, add "Options +Indexes".

This can be accomplished by navigating to the desired directory and entering the following into Terminal:

`echo "Options +Indexes" > .htaccess`

Code explanation:
echo - Normally used to print some text to the screen. But, used in this context, the text that is supposed to be printed to the screen gets written to our file.
"Options +Indexes" - The text contained in the quotations will be written to the desired file. "Options +Indexes" is an instruction for Apache (a common server software) to display an index of all files in the directory.

This is the write-to-file instruction.
.htaccess - The name of the file that you want your echo command to write to. If the file name does not already exist, this file will be created.

---

### Download all files from a website to a location on Eagle

This example is how to download all high-throughput sequencing files from UW HTGU directly to Eagle (NOTE: This will not work natively in Windows, as Windows doesn't have a SSH client. Download and install Cygwin or OpenSSH to gain SSH functionality in Windows).  

1. SSH into Eagle
- Open Terminal
`ssh root@Eagle.IP.address`
- The first time you use this, you will be asked if you trust this IP address. Enter: `yes`
- Enter admin account password when prompted

2. Change to desired working directory under "volume1" directory. Starting directory is "root/". Will have to go up a level and then change to "volume1" directory.

3. Download all files in the specific directory on the UW HTGU server.
- Note: Your file location will differ from the example code listed below.

Example (download all data from a folder from HTGU, requiring a username and password):

```
wget -r --http-user=HTGUusername --http-password=HTGUpassword --no-check-certificate --reject="index.html*" --secure-protocol=auto -np -e robots=off --wait=2 https://data.htseq.org/UW_White/FCC1FB1/

```

Code explanation:

wget: Program on Eagle that allows remote file retrieval    
-r: Instructs wget to download recursively, meaning all folders/files     underneath the final directory in the URL will be downloaded.     
--http-user=: Allows you to enter the user name to log on to the HTGU server     
--http-password=: Allows you to enter the password to log on to the HTGU      server     
--no-check-certificate: Tells wget not to check the server's certificate, although it still seems to check it and let you know that the certificates don't match.     
--reject="index.html*": Tells wget to skip any index.html files. We don't need these.     
--secure-protocol=auto: Since the HTGU site is https (the 's' stands for "secure"), this tells wget to automatically determine which type of security is in use.     
-np: Stands for "no parent." This tells wget to only go down through directories and not go up. This prevents wget from potentially downloading every single file above the specified directory.     
-e robots=off: Tells wget to ignore the "robots.txt" file on the HTGU server. The "robots.txt" file prevents webcrawlers from using too many server resources, which wget normally respects.     
--wait=2: Tells wget to wait 2 seconds between each file download request. This is simply to ease the load on the HTGU servers, since we're initiating such a large download task.     
https://data.htseq.org/HTGUusername/yourdatafolder/: Tells wget where the data is that you want to download.     

Note: Despite specifying recursive downloading, directory structure is NOT maintained. All files are downloaded, but are not contained in any folders.

---

###Copy Files from/to Locations Using SSH (Terminal)
(NOTE: This will not work natively in Windows, as Windows doesn't have a SSH client. Download and install Cygwin or OpenSSH to gain SSH functionality in Windows).


Copy something from this system to some other system:
`scp /path/to/local/file username@hostname:/path/to/remote/file`
 

Copy something from some system to some other system:
`scp username1@hostname1:/path/to/file username2@hostname2:/path/to/other/file`
 

Copy something from another system to this system:
`scp username@hostname:/path/to/remote/file /path/to/local/file`

---


Set Up SSH Keys for More Secure SSH to Hummingbird(Terminal)
For any SSH connection to Humminbird (or any server), SSH keys should be used.

Instructions are for Macintosh OS X
1. Generate your SSH keys.
In Terminal, paste the following:
ssh-keygen -t rsa
Press "Enter" at both prompts for a passphrase.
Note: You can certainly enter a passphrase if desired, but the passphrase is only needed in instances where someone has obtained control of your laptop/desktop that you use to connect to Hummingbird. By not entering a passphrase, you obtain the luxury of being able to use SSH without the need to type a password.

2. Obtain a script to simplify copying your SSH key to the server.
In Terminal, paste the following:
```
sudo curl https://raw.github.com/beautifulcode/ssh-copy-id-for-OSX/master/ssh-copy-id.sh -o /usr/local/bin/ssh-copy-id -k
```

3. Change permissions on the "ssh-copy-id" script to make it executable.
In Terminal, paste the following:
```
sudo chmod +x /usr/local/bin/ssh-copy-id
```

4. Copy your SSH key to the server using the "ssh-copy-id" script.
In Terminal, paste the following:
```
ssh-copy-id username@Hummingbird's.IP.address
```
You'll be prompted to enter your password for your Hummingbird user account.

5. Test it out.
In Terminal, connect to Humminbird using SSH



###View md5 checksum hash (in OSX Terminal)

A md5 checksum hash is a unique "fingerprint" for each and every file. This hash (which is a string of characters) is used to compare file integrity after transferring a file to a new location (or checking file integrity before and after compression). If the file has successfully transferred (i.e. has not been corrupted), the md5 hash will be the same as it was before the file was transferred.

Before copying/moving a file (particularly large files):
$md5 /original/path/to/file

After copying/moving your file:
$md5 /new/path/to/file

Compare the hashes provided from both before and after moving the files. If the hashes do NOT match, then the file was modified during transfer and the file should be transferred again.





###Create and compare md5 checksum hash files (in OSX Terminal)
The following step is performed twice: once before transferring files and again once the files are finished transferring. It is likely helpful to transfer your pre-transfer md5 file when you transfer your files. After transferring, make a new md5 file (with a different name than your pre-transfer md5 file!) from the files that were transferred.


###Create a file containing md5 hashes of multiple files
$md5 file1 file2 file3 >> YourDesiredFileName.md5

Code explanation:

md5 - Program to generate hashes
file1 file2 file3 - The files you want hashes generated from. Can be any number of files.
">>" - Directs the output of md5 to new file and appends each file's hash to the new file.
YourDesiredFileName.md5 - The file name you want to give. Keep the ".md5" suffix for easy file identification.


###Now, compare pre- and post-transfer md5 hash files
$diff PreTransferMD5hashes.md5 PostTransferMD5hases.md5


Code explanation:
diff - Compares files and lists any lines in the files that have differences
PreTransferMD5hashes.md5 - The name of the md5 file containing the hashes of the files pre-transfer.
PostTransferMD5hases.md5 - The name of the md5 file containing the hashes of the files post-transfer.

If there are any differences in the hashes in the two md5 files, those files were corrupted during transfer and should be retransferred.

6/20/2014 - kubu4 kubu4







###Create gzipped tarball file (in Terminal)
This will combine any number of files/directories into a single file (tar) and then compress (gzip) that file to make it smaller.
`$tar -cvzf YourDesiredFileName.tar.gz file1 file2 file3`

Code explanation:
tar - Name of program that combines all files/directories listed into a single file (.tar)
-cvzf - c = create a new archive, v = Verbose to list files being added to archive, z = gzip, f = file archive
YourDesiredFileName.tar.gz - User's desired file name for the tarball gzip file that will be created. Keep the ".tar.gz" part of the file name!
file1 file2 file3 - The list of files and/or directories that you want to include in the tarball. This is not limited to only 3 files/directories.



###Decompress and extract tarball gzipped file (in Terminal)
This will perform two functions simulataneously
- Unzip (decompress) the tarball file
- Extract the contents of the tarball file.
`$tar -zxvf filename.tar.gz`

Code explanation:
tar - Name of program to use.
-zxvf - z = Work on gzip compression automatically when reading compressed files, x = Extract archive, v = Verbose to list files extracted, f = Read the archive file specified
filename.tar.gz - name of the tarball gzipped file that you want to extract



###View files contained in a gzipped tarball file (in Terminal)
`$tar -tvf filename.tar.gz`

Code explanation:
tar - Name of program to use.
-tvf - t = Table of file contents, v = Verbose to list files in archive, f = Read the archive file specified
filename.tar.gz - Name of the gzipped tarball file whose content you'd like to view.

6/20/2014 - kubu4 kubu4


Append (add) files to an existing tarball file (in Terminal)
$tar -rf path/to/tarball/file.tar path/to/file/to/add

NOTE: If the tarball is gzipped, you will have to unzip the tarball, append your file, then re-zip the tarball.
9/4/2014 - kubu4 kubu4



Decompress (unzip) a gzipped file (in Terminal)
$gunzip file.gz
9/4/2014 - kubu4 kubu4



Compress (gzip) a file (in Terminal)
$gzip filename
9/4/2014 - kubu4 kubu4


awk One-Liners
Count Number of Sequences in a FASTA File
$awk '/>/ { count++ } END { print count }' path/to/InputFastFile.fasta

Code explanation:
/>/
- Tells awk to look for whatever regular expression is between the two slashes. In this instance, a greater-than symbol (which identifies a new sequence entry in a FASTA file).

{ count++ }
- Tells awk to assign the variable called "count" to the results of counting ("++") all of the greater-than symbols it encounters

END{ print count }
- Tells awk to print the variable called "count", which is the total number of ">" in our input FASTA file

NOTE: If the sequence IDs of your FASTA file also contain ">", the one-liner listed above will report an inaccurate result. However, as FASTA formatting goes, a ">" should never appear in the file other than as a sequence ID indicator.

3/31/2014 - kubu4 kubu4



Filter FASTA File by Minimum Sequence Length
Just change the number "200" in the code below to your desired minimum sequence length.
$ awk '!/^>/ { next } { getline seq } length(seq) >= 200 { print $0 "\n" seq }' /path/to/InputFastaFile.fasta > /path/to/OutputFastaFile.fasta
Code explanation:
!/^>/ {next }
– If a line (i.e. record) begins with a “>”, go to the next line (record). The "!" tells awk to skip the regular expression that immediatley follows. The "^" tells awk that the regular expression it's looking for should only match if it's at the beginning of a line. Finally, the regular expression we're looking for in this example is the ">", which denotes the sequence descriptor portion of FASTA files.
{ getline seq }
– “getline” reads the next record and assigns the entire record to a variable called “seq”
length(seq) >=200
– If the length of the “seq” record is greater than, or equal to, 200 then…
{print $0 "\n" seq>}
– Print all records ($0) of the variable “seq” in the file that matched our conditions, each on a new line (“\n”)

3/31/2014 - kubu4 kubu4






sed One-Liners
Basic Substitutions in a File
This is the same as Find and Replace in programs like Microsoft Word, but will run on files that are too large to be opened with such programs.

$sed 's/text_you_want_replaced/replacement_text/g' path/to/source_file > path/to/destination_file

Code explanation:

- "s" invokes the substitute command in sed
- "g" tells sed to apply the substitute command globally on each line. Without the "g" argument, sed will only apply your substitute command to the first instance it encounters on each line that contains your "text_you_want_replaced".

NOTE: This command is case sensitive and will only match EXACLTY what you enter in as the "text_you_want_replaced". If you need more flexibility (e.g. having sed find variations like upper- and lowercase text), it exists, but is a bit too in-depth to go into here.

5/20/2014 - kubu4 kubu4



Audible Notification of Job Completion (Terminal)
After typing in a Terminal command (and before hitting 'Enter') add the following:
; say "Text that you want to have the computer read aloud to notify you that the job is finished"

Code explanation:
; - Semicolon separates the "say" command from the previous command.
say - The speech-to-text command for Terminal
"text between quotes" - This is the text that you want to be read when your job is finished.

- 11/8/2013 - kubu4 kubu4


Show Hidden Files in Mac OSX 10.8, 10.7 and 10.6 (Terminal)
In Terminal enter
defaults write com.apple.Finder AppleShowAllFiles True

After pressing enter, the Finder needs to be restarted for the changes to take place.
In Terminal type:
killall Finder

To revert back, simple repeat from the first step, but change the word "True" in the first entry to "False". Remember to follow up with the killall Finder command to restart the Finder!
- kubu4 kubu4 3/5/2014


IPython

Start IPython in a web browser (via Terminal or Command Line):
ipython notebook
Or, type this URL into a browser: http://127.0.0.1:8888
- kubu4 kubu4 10/25/2013


Start a specific notebook in a web browser (via Terminal or Command Line):
ipython notebook /path/to_your/notebook.ipynb
NOTE: By saving your notebook files to Dropbox, you will have access to all your notebooks on any computer with Dropbox installed.
NOTE: Default notebook save location (on Mac OSX) is: /Users/Username/Notebook_name.ipynb. 
- kubu4 kubu4 10/25/2013


Run IPython on a remote computer (e.g. Hummingbird)
The following instructions are for Linux or OS X

Tunneling into Hummingbird
1. Open Terminal.
2. Enter
ssh -N -L localhost:8000:localhost:7000 srlab@Hummingbird.IP.address
Note: If it's your first SSH session into Hummingbird, you may be prompted with a message. Answer "yes" to the message. After that, you may have to start the SSH session again.
Note: If you get a message that port 8000 is already in use, feel free to change to a different port (i.e. any number greater than 8000, but less than 65000) and try again.
3. Enter the srlab password on Hummingbird
Note: You can change "srlab" to your personal login on Hummingbird, if you so desire.
4. Terminal should look like it's active at this point (i.e. it does NOT return the command prompt)

The above steps have created a tunnel into Hummingbird.

Start IPython on Hummingbird
1. Open a new Terminal window. Do NOT close the previous window. We need it open to maintain that tunnel.
2. Enter
ssh srlab@Hummingbird.IP.address
3. Enter the srlab password for Hummingbird
Note: You should login to the same account as specified in the tunnel instructions above (e.g. srlab and srlab).
Note: You should notice that your command prompt now has "Hummingbird" in it, indicating you are now inside Hummingbird.
Note: You may wish to change directories to the directory on Hummingbird that you want IPython to launch from.
4. Enter
ipython notebook --no-browser --port=7000

The above steps have remotely logged you into Hummingbird and starts IPython without the browser.

Start IPython in your browser.
1. Open a browser (e.g. Chrome, Firefox, etc) on your computer.
2. In the URL bar, enter
localhost:8000
Note: The port listed here (8000) needs to match the first localhost port entered in Step 2 of the tunneling procedure described above.

The web interface for IPython should open, but since you specified port 7000 (that's what the ':7000' means in the above step), your browser tunnels into Hummingbird and launches it from Hummingbird. You are now using IPython on Hummingbird!

Bonus Tip!
Mount your Eagle web folder for easy access to your files when using IPython remotely on Hummingbird.
1. Open a new Terminal window and SSH into Hummingbird (see instructions above).

2. Make the directory where you want your Eagle web in the /Volumes directory. Example:
mkdir /Volumes/Eagle

3. Mount your Eagle web folder. Example:
mount_afp -i "afp://username@eagle.fish.washington.edu/web/web_folder_name" /Volumes/Eagle
Explanation:
mount_afp = Specifies drive mounting protocol
-i = Prompts for user password after connection to server
"afp://username@server.address/share/folder" = Specifies username, address and which folder to connect to.
/Volumes/Eagle = This should match the directory you created in Step #2.

4. Enter password when prompted.

- kubu4 kubu4 3/14/2014


Change the default save location for IPython notebooks (via Terminal)
There are two choices for this:

Option #1 - Change to your desired directory each time you start IPython

Start Terminal.
Change to the desired directory.
Launch IPython.

NOTE: To speed this up, you could just create a shortcut (a.k.a. a symbolic/sym link to your desired directory) so that instead of typing in a very long directory path each time, you could just type: cd yoursymlink



Option #2 - Modify your IPython configuration file to indicate the desired location at IPython startup automatically

Locate your IPython installation location.
- In Terminal, type:
ipython locate
The output of that will tell you where IPython is installed.
Navigate to that directory via the Finder (NOTE: You will have to turn on the ability to view Hidden Files. See the section on this page above for instructions on how to do that.).
Browse to the "Profile Default" folder. If you do NOT have a file called "ipython_notebook_config.py" then type the following in Terminal:

ipython profile create
In your "ipython_notebook_config.py" file, find and edit (open the file with a text editor) these lines (hint: they're at the very end of the "ipython_notebook_config.py" file):
# The directory to use for notebooks.
#c.NotebookManager.notebook_dir=u'/path/to/your/notebooks'
AND
# The directory to use for notebooks.
# c.FileNotebookManager.notebook_dir = u'/Users/Sam'
Change them to:
# The directory to use for notebooks.
c.NotebookManager.notebook_dir=u'/path/to/your/notebooks'
AND
# The directory to use for notebooks.
c.NotebookManager.notebook_dir=u'/path/to/your/notebooks'
where you enter in the directory path where you want your notebooks saved by default in the '/path/to/your/notebooks'. Also note that the # symbol needs to be removed before the lines that begin with "c."

Save the file.

Now, when you launch IPython, it should start you in the directory you specified in the "ipython_notebook_config.py" file!
- kubu4 kubu4 3/5/2104



Execute non-native (i.e. downloaded from the internet) command line programs (via Terminal):

Option #1 example
!/Applications/sratoolkit.2.3.3-4-mac64/bin/fastq-dump.2.3.3-3 /Users/Sam/Desktop/SRR039705.sra
Explanation:
This option requires two elements. The first required element is the "!". This is equivalent to "./" to run a program in Terminal. The second required element is to specify the full path of the program you want to use (!/Applications/sratoolkit.2.3.3-4-mac64/bin/fastq-dump.2.3.3-3). This is different than using Terminal, where you can navigate to the file directory and run the program while in the directory.


Option #2 example
!fastq-dump.2.3.3-3 /Users/Sam/Desktop/SRR039705.sra
Explanation:
This option requires that the command line program be located in (on Mac OSX): /usr/local/bin
See the section immediately below this for instructions on how to copy a program to /usr/local/bin
NOTE: In order to enable this, some permissions need to be changed on /usr/local/bin. Using command line, enter: sudo chmod 4755 /usr/local/bin
This will now allow you to add additional users and grant them read/write permissions via the Finder's "Get Info" menu. In Finder, use the "Go" > "Go to folder..." and enter /usr/local/bin. Right-click on the "bin" folder, "Get Info" and then you can add your user account and enable read/write permissions (you must be an administrator to make these changes).


Copy program for a command line program to /usr/local/bin (via Terminal):
!cp -i /path/to_your_file/your_file /usr/local/bin
Explanation:
! - Equivalent to "./" in Terminal. Runs the target command
cp - The copy command in Terminal
-i - If destination contains duplicate file name, it will prompt you before overwriting the existing file
/path/to_your_file/your_file - The path to the file you want to copy
/usr/local/bin - The path to the destination folder of your file
- kubu4 kubu4 10/25/2013


Run code in a cell:
Type your code in a cell and press Ctrl+Enter
- This will execute the code in just that cell and the cursor will remain in that cell.
- kubu4 kubu4 10/8/2013


Run code in a cell and insert a new cell below:
Type your code in a cell and press Shift+Enter
- This will execute the code in just that cell, insert a cell below and put your cursor in the new cell.
- kubu4 kubu4 10/8/2013


Install a python module/package:
After downloading your desired module/package, navigate to the module's folder in Terminal or Command Line and type:
python setup.py install --user
- This will initiate python and run the setup file (setup.py) for the module. Don't know why "--user" is necessary, but it seems to be.
- kubu4 kubu4 10/8/2013
