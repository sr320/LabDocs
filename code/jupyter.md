#  Jupyter
 
###  Convert number stored in variable
 If using a bash commands to store numbers to variables in Jupyter (IPython) notebooks, the variable will store the number as a Python string list instead of just the actual number. This is identifiable by the format of the ```print``` command output. Here's an example:
 
 Input: ```print variable```
 
 Output: ```['102345']```
 
 The square brackets and the value of your variable stored within single quotes indicate a string list format. 
 
 Convert the value in the string list to a number (integer in this example) that can more readily be accessed by other steps in your notebook:
 
 Input: ```int(variable[0])```
 
 Input: ```print variable```
 
 Output: ```102345```
 
 ___Explanation___
 
 The ```int(variable[0])``` changes the value in our string list (```variable```) at position/index 0 (```[0]```) in that list to an integer (```int```). 
 
 Note: You may need to use ```float``` instead of ```int``` if you have a non-integer value stored in your variable!
 
 
 
 
 
###  Embed IPython notebook hosted on nbviewer in onsnetwork.org wordpress
 `iframe` can be used for this, something normally not allowed on wordpress.com.
 Here is an example
 ```
 [iframe src="http://nbviewer.ipython.org/github/sr320/paper-Temp-stress/blob/authorea/ipynb/Array-feature-overlap-03.ipynb" width="100%" same_height_as="window" scrolling="yes"]
 ```
 This code is used on 
 http://onsnetwork.org/halfshell/2015/03/02/up-down-in-the-house/
 
###  Embed Jupyter (iPython) notebook hosted on GitHub in onsnetwork.org wordpress
 
####  Obtain the Jupyter Notebook GitHub URL
 1. Go to GitHub page to view the Jupyter (iPython) Notebook
 2. Right-click on the Jupyter (iPython) Notebook
 3. View the source for the frame - the verbiage varies by browser.
 4. Copy the URL (should begin with https://render.githubusercontent.com).
 5. Paste the URL into the iframe code shown in example above.
 
 
###  Start IPython in a web browser (via Terminal or Command Line):
 `ipython notebook`
 Or, type this URL into a browser: http://127.0.0.1:8888
 
 
###  Start a specific notebook in a web browser (via Terminal or Command Line):
 `ipython notebook /path/to_your/notebook.ipynb`   
 
 NOTE: By saving your notebook files to Dropbox, you will have access to all your notebooks on any computer with Dropbox installed.
 
 NOTE: Default notebook save location (on Mac OSX) is: /Users/Username/Notebook_name.ipynb. 
 
 
 
###  Run IPython on a remote computer (e.g. Hummingbird)
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
 `ssh srlab@Hummingbird.IP.address`
 
 3. Enter the srlab password for Hummingbird
 
 	Note: You should login to the same account as specified in the tunnel instructions above (e.g. srlab and srlab).
 
 	Note: You should notice that your command prompt now has "Hummingbird" in it, indicating you are now inside Hummingbird.
 
 	Note: You may wish to change directories to the directory on Hummingbird that you want IPython to launch from.
 
 4. Enter   
 
 `ipython notebook --no-browser --port=7000`
 
 The above steps have remotely logged you into Hummingbird and starts IPython without the browser.
 
 Start IPython in your browser.
 
 1. Open a browser (e.g. Chrome, Firefox, etc) on your computer.
 
 2. In the URL bar, enter
 `localhost:8000`
 
 Note: The port listed here (8000) needs to match the first localhost port entered in Step 2 of the tunneling procedure described above.
 
 The web interface for IPython should open, but since you specified port 7000 (that's what the ':7000' means in the above step), your browser tunnels into Hummingbird and launches it from Hummingbird. You are now using IPython on Hummingbird!
 
 **Bonus Tip!**
 Mount your Eagle web folder for easy access to your files when using IPython remotely on Hummingbird.
 
 1. Open a new Terminal window and SSH into Hummingbird (see instructions above).
 
 2. In the /Volumes directory, make the directory where you want your Eagle web folder. Example:
  
 		mkdir /Volumes/Eagle
 
 3. Mount your Eagle web folder. Example:
 
 		mount_afp -i "afp://username@eagle.fish.washington.edu/web/web_folder_name" /Volumes/Eagle
 
 	Explanation:
 
 	mount_afp = Specifies drive mounting protocol
 
 	-i = Prompts for user password after connection to server
 
 	"afp://username@server.address/share/folder" = Specifies username, address and which folder to connect to.
 
 	/Volumes/Eagle = This should match the directory you created in Step #2.
 
 4. Enter password when prompted.
 
 
###  Change the default save location for IPython notebooks (via Terminal)
 There are two choices for this:
 
 Option #1 - Change to your desired directory each time you start IPython
 
 Start Terminal.
 
 Change to the desired directory.
 
 Launch IPython.
 
 NOTE: To speed this up, you could just create a shortcut (a.k.a. a symbolic/sym link to your desired directory) so that instead of typing in a very long directory path each time, you could just type: cd yoursymlink
 
 
 
 Option #2 - Modify your IPython configuration file to indicate the desired location at IPython startup automatically
 
 Locate your IPython installation location.
 
 - In Terminal, type:
 `ipython locate`
 
 The output of that will tell you where IPython is installed.
 Navigate to that directory via the Finder (NOTE: You will have to turn on the ability to view Hidden Files. See the section on this page above for instructions on how to do that.).
 Browse to the "Profile Default" folder. If you do NOT have a file called "ipython_notebook_config.py" then type the following in Terminal:
 
 `ipython profile create`
 In your "ipython_notebook_config.py" file, find and edit (open the file with a text editor) these lines (hint: they're at the very end of the "ipython_notebook_config.py" file):  
 
 ```
# The directory to use for notebooks.
# c.NotebookManager.notebook_dir=u'/path/to/your/notebooks'
 ```
 
 AND   
 
 ```
#  The directory to use for notebooks.
#  c.FileNotebookManager.notebook_dir = u'/Users/Sam'
 ```
 
 Change them to:   
 
 ```
#  The directory to use for notebooks.
 c.NotebookManager.notebook_dir=u'/path/to/your/notebooks'
 ```
 
 AND   
 
 ```
#  The directory to use for notebooks.
 c.NotebookManager.notebook_dir=u'/path/to/your/notebooks'
 ```
 where you enter in the directory path where you want your notebooks saved by default in the '/path/to/your/notebooks'. Also note that the # symbol needs to be removed before the lines that begin with "c."
 
 Save the file.
 
 Now, when you launch IPython, it should start you in the directory you specified in the "ipython_notebook_config.py" file!
 
 
 
### Execute non-native (i.e. downloaded from the internet) command line programs (via Terminal):
 
 Option #1 example
 
 `!/Applications/sratoolkit.2.3.3-4-mac64/bin/fastq-dump.2.3.3-3 /Users/Sam/Desktop/SRR039705.sra`
 
 Explanation:
 
 This option requires two elements. 
 
 The first required element is the "!". This is equivalent to "./" to run a program in Terminal. 
 
 The second required element is to specify the full path of the program you want to use (`!/Applications/sratoolkit.2.3.3-4-mac64/bin/fastq-dump.2.3.3-3`). This is different than using Terminal, where you can navigate to the file directory and run the program while in the directory.
 
 
 Option #2 example
 
 `!fastq-dump.2.3.3-3 /Users/Sam/Desktop/SRR039705.sra`  
 
 Explanation:
 
 This option requires that the command line program be located in (on Mac OSX): /usr/local/bin
 
 See the section immediately below this for instructions on how to copy a program to /usr/local/bin
 
 NOTE: In order to enable this, some permissions need to be changed on /usr/local/bin. Using command line, enter: `sudo chmod 4755 /usr/local/bin`
 
 This will now allow you to add additional users and grant them read/write permissions via the Finder's "Get Info" menu. In Finder, use the "Go" > "Go to folder..." and enter /usr/local/bin. Right-click on the "bin" folder, "Get Info" and then you can add your user account and enable read/write permissions (you must be an administrator to make these changes).
 
 
###  Copy program for a command line program to /usr/local/bin (via Terminal):
 `!cp -i /path/to_your_file/your_file /usr/local/bin`
 
 Explanation:
 
 ! - Equivalent to "./" in Terminal. Runs the target command
 
 cp - The copy command in Terminal
 
 -i - If destination contains duplicate file name, it will prompt you before overwriting the existing file
 
 /path/to_your_file/your_file - The path to the file you want to copy
 
 /usr/local/bin - The path to the destination folder of your file
 
 
###  Run code in a cell:
 
 Type your code in a cell and press Ctrl+Enter
 
 - This will execute the code in just that cell and the cursor will remain in that cell.
 
 
###  Run code in a cell and insert a new cell below:
 
 Type your code in a cell and press Shift+Enter
 
 - This will execute the code in just that cell, insert a cell below and put your cursor in the new cell.
 
 
###  Install a python module/package:
 
 After downloading your desired module/package, navigate to the module's folder in Terminal or Command Line and type:
 
 `python setup.py install --user`   
 
 - This will initiate python and run the setup file (setup.py) for the module. Don't know why "--user" is necessary, but it seems to be.
