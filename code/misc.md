# miscellaneous bits
 
 
### Restarting CLC Server (bigfish)
 
 ```
 cd /Volumes/bigfishRAID/common/CLCGenomicsServer
 ./CLCGenomicsServer status
 ./CLCGenomicsServer start
 ./CLCGenomicsServer status
 ```
 
 ---
 
### Directory listing of all files in a folder on a website
 Add a file called ".htaccess" to any directory where a public directory listing is desired. To the .htaccess file, add "Options +Indexes".
 
 This can be accomplished by navigating to the desired directory and entering the following into Terminal:
 
 `echo "Options +Indexes" > .htaccess`
 
 Code explanation:
 
 ```echo``` - Normally used to print some text to the screen. But, used in this context, the text that is supposed to be printed to the screen gets written to our file.
 
 ```"Options +Indexes"``` - The text contained in the quotations will be written to the desired file. "Options +Indexes" is an instruction for Apache (a common server software) to display an index of all files in the directory.
 
 ```>``` - This is the write-to-file instruction.
 
 ```.htaccess``` - The name of the file that you want your echo command to write to. If the file name does not already exist, this file will be created.
 
 ---
 
###  Download all files from a website to a location on Eagle
 
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
 
### Copy Files from/to Locations Using SSH (Terminal)
 (NOTE: This will not work natively in Windows, as Windows doesn't have a SSH client. Download and install Cygwin or OpenSSH to gain SSH functionality in Windows).
 
 
 Copy something from this system to some other system:
 `scp /path/to/local/file username@hostname:/path/to/remote/file`
  
 
 Copy something from some system to some other system:
 `scp username1@hostname1:/path/to/file username2@hostname2:/path/to/other/file`
  
 
 Copy something from another system to this system:
 `scp username@hostname:/path/to/remote/file /path/to/local/file`
 
 ---
 
 
### Set Up SSH Keys for More Secure SSH to Hummingbird(Terminal)
 For any SSH connection to Humminbird (or any server), SSH keys should be used.
 
 Instructions are for Macintosh OS X
 1. Generate your SSH keys.
 In Terminal, paste the following:
 `ssh-keygen -t rsa`    
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
 
 
 
### View md5 checksum hash (in OSX Terminal)
 
 A md5 checksum hash is a unique "fingerprint" for each and every file. This hash (which is a string of characters) is used to compare file integrity after transferring a file to a new location (or checking file integrity before and after compression). If the file has successfully transferred (i.e. has not been corrupted), the md5 hash will be the same as it was before the file was transferred.
 
 Before copying/moving a file (particularly large files):
 $md5 /original/path/to/file
 
 After copying/moving your file:
 $md5 /new/path/to/file
 
 Compare the hashes provided from both before and after moving the files. If the hashes do NOT match, then the file was modified during transfer and the file should be transferred again.
 
 
 
 
 
### Create and compare md5 checksum hash files (in OSX Terminal)
 The following step is performed twice: once before transferring files and again once the files are finished transferring. It is likely helpful to transfer your pre-transfer md5 file when you transfer your files. After transferring, make a new md5 file (with a different name than your pre-transfer md5 file!) from the files that were transferred.
 
 
#### Create a file containing md5 hashes of multiple files
 `$md5 file1 file2 file3 >> YourDesiredFileName.md5`
 
 Code explanation:
 
 md5 - Program to generate hashes
 
 file1 file2 file3 - The files you want hashes generated from. Can be any number of files.
 
 ">>" - Directs the output of md5 to new file and appends each file's hash to the new file.
 
 YourDesiredFileName.md5 - The file name you want to give. Keep the ".md5" suffix for easy file identification.
 
 
#### Now, compare pre- and post-transfer md5 hash files
 `$diff PreTransferMD5hashes.md5 PostTransferMD5hases.md5`
 
 
 Code explanation:
 
 diff - Compares files and lists any lines in the files that have differences
 
 PreTransferMD5hashes.md5 - The name of the md5 file containing the hashes of the files pre-transfer.
 
 PostTransferMD5hases.md5 - The name of the md5 file containing the hashes of the files post-transfer.
 
 If there are any differences in the hashes in the two md5 files, those files were corrupted during transfer and should be retransferred.
 
 
 
### Create gzipped tarball file (in Terminal)
 This will combine any number of files/directories into a single file (tar) and then compress (gzip) that file to make it smaller.
 
 `$tar -cvzf YourDesiredFileName.tar.gz file1 file2 file3`
 
 Code explanation:
 
 tar - Name of program that combines all files/directories listed into a single file (.tar)
 
 -cvzf - c = create a new archive, v = Verbose to list files being added to archive, z = gzip, f = file archive
 
 YourDesiredFileName.tar.gz - User's desired file name for the tarball gzip file that will be created. Keep the ".tar.gz" part of the file name!
 
 file1 file2 file3 - The list of files and/or directories that you want to include in the tarball. This is not limited to only 3 files/directories.
 
 
 
### Decompress and extract tarball gzipped file (in Terminal)
 This will perform two functions simulataneously
 - Unzip (decompress) the tarball file
 - Extract the contents of the tarball file.
 
 `$tar -zxvf filename.tar.gz`
 
 Code explanation:
 
 tar - Name of program to use.
 
 -zxvf - z = Work on gzip compression automatically when reading compressed files, x = Extract archive, v = Verbose to list files extracted, f = Read the archive file specified
 
 filename.tar.gz - name of the tarball gzipped file that you want to extract
 
 
 
### View files contained in a gzipped tarball file (in Terminal)
 
 `$tar -tvf filename.tar.gz`
 
 Code explanation:
 tar - Name of program to use.
 -tvf - t = Table of file contents, v = Verbose to list files in archive, f = Read the archive file specified
 filename.tar.gz - Name of the gzipped tarball file whose content you'd like to view.
 
 
 
### Append (add) files to an existing tarball file (in Terminal)
 
 `$tar -rf path/to/tarball/file.tar path/to/file/to/add`
 
 NOTE: If the tarball is gzipped, you will have to unzip the tarball, append your file, then re-zip the tarball.
 9/4/2014 - kubu4 kubu4
 
 
 
### Decompress (unzip) a gzipped file (in Terminal)
 `$gunzip file.gz`
 
 
 
### Compress (gzip) a file (in Terminal)
 `$gzip filename`
 
 
 
 
 
 
### Show Hidden Files in Mac OSX 10.8, 10.7 and 10.6 (Terminal)
 In Terminal enter
 
 `defaults write com.apple.Finder AppleShowAllFiles True`
 
 After pressing enter, the Finder needs to be restarted for the changes to take place.
 In Terminal type:
 
 `killall Finder`
 
 To revert back, simple repeat from the first step, but change the word "True" in the first entry to "False". Remember to follow up with the killall Finder command to restart the Finder!
 
 ---
### Add files >100MB to .gitignore file
 
     find ./* -size +100M | cat >> .gitignore
 
 This finds all files in your current directory (presumably a Git repo) greater than 100MB and writes the paths to those files in your .gitignore file.  
 
