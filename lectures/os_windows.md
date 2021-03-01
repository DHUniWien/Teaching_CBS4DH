# Intro to your OS: Getting to know your OS & file and directory system (Windows)

## File system hierarchy

* `\` as the base of each drive on Windows (cf. section below on external drives!)
* Finding the filesystem location of a file from Windows Explorer: Right-click on the file and choose "Properties" / "Eigenschaften". Note that the navigation bar at the top doesn't always tell the truth!
* You can drag any file to the command line to get its full path. This can be quite useful as we navigate!

## Configuring your machine to show filename extensions

* <[screenshot](images/getting_to_know_winconfig.png)> In any File Explorer window, click on the “View”/"Ansicht" tab, and then “Options” on the right to open the “Folder Options”/"Ordneroptionen" window.
	* In the “View”/"Ansicht" tab of this window, uncheck “Hide extensions for known file types”/"Erweiterungen bei bekannten Dateitypen ausblenden" box.

## Configuring your machine to show hidden files, and more

This is recommended to do for the duration of this course, so that the file listings in the Finder/Explorer and on the command line match! You can turn it off again afterwards if you like.

* <[screenshot](images/getting_to_know_winconfig.png)> In the same “Folder Options” window as before,
	* Uncheck "Hide hidden files, folders, and drives" / "Geschützte Systemdateien ausblenden".
		* NOTE: Protected operating system files will still stay hidden.  
	* Also check “Display the full path in the title bar”/"Vollständigen Pfad in der Titelliste anzeigen" (not essential, but recommended).

## File ownership and modes

* See an informational listing of files with `ls -l` for bash or zsh, `ls` or `dir` for Windows PowerShell
* Unix style modes are mostly about permissions: user, group, other.
* But Windows doesn't have the same file permission system! Their "mode" tells you what kind of file it is:
    * `d` - it's a directory
    * `a` - it's an archive (i.e. a file)
    * `r` - it's read-only; this means you can't change the contents unless you change the mode first
    * `h` - it's a hidden file
    * `s` - it's a system file
    * `l` - it's (probably) a symbolic link (what's that?? We'll cover this soon.)
* If you are using Git Bash on Windows, it means that the Unix-style file permission listings are (sort of) lying to you; they are there so that Unix-based programs still work, but they are always reporting that you have permission for everything. This is an important point to bear in mind!

## Launching a terminal

* The Command Prompt **cmd.exe** <[screenshot](images/getting_to_know_cmd.png)> is the native Windows console, which grew out of DOS.  
* The **PowerShell** is the newer native Windows console, meant to have some command compatibility with Unix and to have more scripting power.
	* How to launch: from the Start menu type in “powershell”.
	* NOTE: For later sessions and the remainder of this class we will be using the **Bash shell** instead, which you downloaded and installed as part of Git. This is the command line interface we use and recommend, unless you have a specific reason to use PowerShell.

## Moving through a filesystem
<!-- Move the programs and files stuff in here, use cmd.exe -->
<!-- where is home?  both in cmd and in gui-->
<!-- language differences for gui and command line-->

* Navigate up and down, with emphasis on the paths in the title bar <!-- We should clarify that Git Bash will use forward slashes rather than backslashes, and explain later when we introduce cmd why that's the case.-->
* Drive letter in Windows: `C:\Users` (Windows `cmd`)
	* Drive letter elsewhere: `/c/Users` (Windows Git `bash`), `/Users` (no drive letter in Mac OS and Linux)
* `cd <PATH>`: change directory <!--Open a command line and begin using `cd`. Explain that `cd` is essentially the same as selecting or clicking a folder. `cd` into your home directory.-->
* `dir` or `ls`: list all files

## File/directory path in File Explorer GUI vs. cmd

* Matching the GUI file path with the file/directory path in the terminal
* User-specific directories: where are your home directory, document folder, and desktop? What are their full file/directory paths?
* Non-English OS’s may have translation/localization applied, but only on the GUI side!
	* In German Windows, a user’s Documents folder would appear in File Explorer as "Benutzer > Max Mustermann > Dokumente" or even as "Dieser PC > Dokumente"
	* The same folder will appear on the command line as `C:\Users\Max Mustermann\Documents`
    * Why do you suppose this is...?

## External drives and mounting
How removable and external drives (such as a USB thumbdrive) are treated in GUI vs. terminal environment

* In Windows, they are assigned a new drive letter: `d:\` `e:\` (cmd)
* In Git bash environment (will learn this later), they look like: `/d/` `/e/`

## How to run a program as an administrator

* Right click on a program icon (say, Command Prompt) and select “Run as administrator”.
	* **CAUTION!** You may accidentally break your system by removing essential files or directories.
	* Use only when you have a good reason to; close program when done.

## Environment variables (aka system variables)

* How to view environment variables through a GUI
	* File Explorer -> Right click on 'This PC', select 'Properties' -> Advanced System Settings -> Environment Variables
* How to view environment variables in a terminal
	* In cmd.exe or Bash, type in: `set`
    * In PowerShell, type in: `dir env:`
