# Command Line 4

In this session we will be looking primarily at two things: first, how the shell can be used to automate things, and second, what the **environment** is and how it affects the operation not only of your shell, but also of the programs you run in general.

## Loops

* Automating tedious things with `for` loops

The structure of a `for` loop looks like this. Everything that is not in capital letters is a required part of the structure.

    $ for NAME in LIST; do
    > COMMAND_1 $NAME
    > COMMAND_2 $NAME
    > # ...AS MANY COMMANDS AS YOU NEED
    > done

  - `NAME` is a **variable** and you can call it whatever you like, e.g. `for filename in LIST` or `for item in LIST`
  - the `LIST` is a space-separated list of items
  - (if you use a wildcard such as `*.txt`, this gets expanded by the shell to be a space-separated list of files in the current directory that end in `.txt`)
  - each item in the LIST will have a turn through the given commands, where it can be referenced as `$NAME` (e.g. `$filename` or `$item`)
  - Each command in turn can be executed with `$NAME` in the arguments somewhere

Example:

    $ for datafile in *.dat; do
    > echo $datafile
    > ./process.sh $datafile > result-$datafile
    > done

## Scripting

* You can put bash commands into a file for later reuse
* yes, this is already programming!
* Run the commands by saying `bash ` and then the name of the file where you put the commands

## The environment

Every process (a.k.a program, roughly speaking) runs in an *environment*. This environment can be thought of as small pieces of information floating in the air, each of which has a name and can be looked up.

* See the environment of your shell with the `set` command (which you will probably want to pipe through a pager like `less`!)
* The names given to the information are called *environment variables*, e.g. PATH or LC_CTYPE
* Some of these environment variables are very important to know about! e.g. your PATH controls where the shell looks to find the command you have asked it to execute
* You can see this in effect by changing your LANG environment variable to any of the values you get when you run `locale -a` and then running the `date` command
* You set an environment variable in bash by using the `export` command, e.g. `export LANG=de_AT.UTF-8`. The change will be in effect until you `exit` that shell instance!
* You can set an environment variable permanently by putting the relevant `export` command in your shell *dotfiles* (e.g. `.profile`)
