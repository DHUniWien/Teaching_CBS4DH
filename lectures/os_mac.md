# Intro to your OS: Getting to know your OS & file and directory system (Mac)

[Introduction; verify that everyone’s Internet connections work]

## File system hierarchy

* `/` as the center of the filesystem universe
* Directories are a special kind of file
* `/dev/null`: the black hole of the file system
* Finding the filesystem location of a file from the MacOS Finder: From the 'View' menu, choose to show the 'Path Bar'. You can also drag the file from a Finder window into terminal window to paste the path to the file directly on your command line.

## Configuring your machine to show filename extensions

* Open Finder and select Preferences, click “Advanced”, and check the box next to “Show all filename extensions”.

## Configuring your machine to show hidden files

(Mac OS Sierra and later): Open Finder and hit `Cmd+Shift+.` Do the same thing to hide these files again.


## File ownership and permissions (a.k.a. modes)

* `ls -l`
* user, group, other
* `chown` (You probably can’t change ownership on shared systems and don’t need to do it on your own machine. This command is useful if you install something incorrectly.)
* `chmod` (“644”, “664” for files; “755”, “775” for directories)


## Launching a terminal

* The **Terminal.app** that you will find in the Applications → Utilities folder. (Many Mac users prefer the free third-party <https://www.iterm2.com/>.)
* For Ubuntu Desktop (Unity): you can hit Ctrl-Alt-T or you can type `Terminal` into the Search box.

## Moving through a filesystem
<!-- Move the programs and files stuff in here, use cmd.exe -->
<!-- where is home?  both in cmd and in gui-->
<!-- language differences for gui and command line-->

* Navigate up and down, with emphasis on the paths in the title bar
* `cd`: change directory <!--Open a command line and begin using `cd`. Explain that `cd` is essentially the same as selecting or clicking a folder. `cd` into your home directory.-->
* `ls`: list all files  <!--Use `ls` to show all the files in your current (when you first open the terminal, home) directory. Compare that to what you now see in your home directory (or C drive “folder”). Then use `cd Documents` to move into your documents folder. This is a relative path, as you’ve navigated relative to where you’ve started. Explain what an absolute path looks like, and try running one. Then run a few relative paths.-->

## File/directory path in file explorer GUI vs. shell

* Matching the GUI file path with the file/directory path in the terminal
* User-specific directories: where are your home directory, document folder, and desktop? What are their full file/directory paths?
* Non-English OS’s may have translation/localization applied, but only on the GUI side!
    * In German Windows, a user’s Documents folder would appear in File Explorer as "Macintosh HD > Benutzer > maxmm > Dokumente"
    * The same folder will appear on the command line as `/Users/maxmm/Documents`
    * Why do you suppose this is...?

## External drives and mounting
How removable and external drives (such as a USB thumbdrive) are treated in GUI vs. terminal environment

* In Mac OS, they are mounted underneath `/Volumes` when you plug them in. Unmount them by following the instructions at [Mount and unmount drives from the command line in Mac OS X](http://osxdaily.com/2013/05/13/mount-unmount-drives-from-the-command-line-in-mac-os-x/).

## How to run a program as an administrator

* The GUI will generally ask you if you need to do this
* On the command line, precede the command with `sudo`.

## Environment variables (aka system variables)

* How to view environment variables
	* In Terminal, type in: `set`
    * Some environment variables are set for your whole system! However, MacOS doesn't make it easy to see which ones these are. That said, anything that is set for your system will also be set within the shell.
