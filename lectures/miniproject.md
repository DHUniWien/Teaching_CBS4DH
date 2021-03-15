# Putting it all together

To wrap up this class, we are going to put together the skills we have learned on the command line, with regular expressions, with web authoring, and with Git to make a mini project and push it live to Github Pages.

## Make / fork your miniproject repository

The first step is to create the repository where your miniproject will live! You will do this by using one of Github's more well-known collaboration features, which is the ability to **fork** someone else's repository. Go ahead and visit https://github.com/DHUniWien/miniproject and click the 'Fork' button in the top right-hand corner, which will make a copy of this repository in your own user space.

Once that is done, you can **clone** the newly forked repository into your project workspace on your computer, using the `git clone` command, and change into the miniproject directory.

## Get the data

The next step is to get the data that will power your project! Here we will be using data from Wikipedia about people who died in the year 2011, and we will be applying our regular expression skills to get the data into a form that we can use.

1. Navigate to https://en.wikipedia.org/w/index.php?title=2011 and choose 'Deaths' from the table of contents
2. Click the '[edit]' link next to the 'Deaths' heading
3. Copy the contents of the big text box into an Atom window.

Now we are going to convert this into CSV format, which is a simplified representation of spreadsheet data. In fact we will be using semicolon separation instead of comma separation, both because most of you are working in languages where semicolon delimiters are the norm for CSV, and because there are commas in some of the descriptions that will otherwise cause trouble. Here are the steps we will follow.

- First we need to remove all the lines that don't mention a particular day. We can do this by searching for `^[^\*].*$\n` and replacing it with nothing.
  - (What exactly is this regular expression doing?)
- Next, we notice that some days have deaths spread out over multiple line, if multiple notable people died that day. This means that we need to copy the correct month/day onto all the lines that start with `**`. We can do this by searching for `^(\* (\[\[\w+ \d+\]\]))\s*$((\n\1).*?)*\n\*\*` and replacing it with `$1$3\n* $2 &ndash;`; we might have to run this replacement a few times until no more matches are found.
  - (This is a pretty complex regular expression and uses something called a **backreference** which we haven't talked about yet; what is it doing exactly?)

The next few steps make a good group exercise. For sanity's sake, **make a note of all the regular expressions you use, and in which order, in case you need to backtrack or start over**!

- Remove all the lines that now have a month and day but no other information.
- Replace the dashes (as well as the \&ndash; stand-ins for dashes) with commas. Ideally there shouldn't be a space on either side of the comma!
- Change all the dates e.g. '* [[January 4]]' to just 'January 4' or similar.
- Now we need to wrap the person descriptions in quotation marks, since some of the descriptions contain a comma. Write a regular expression to find these descriptions (hint: what do we find on either side of a description that we can use to anchor it?)
- BEFORE you do any replacing of text, notice that there are three people who don't have descriptions in the usual sense. Change these lines so that they match the rest, but **do not change the text inside square brackets** unless you are already familiar enough with Wikipedia format to know what you're doing!
- Now that you have done this, write a replacement function that wraps the descriptions you have isolated in "double quote" marks. While you're at it, remove the space after the comma at the beginning of this description.
- Remove all remaining `[[ ]]` brackets.
- Change the ' (b. 1941)' data to look like ',1941'

Once you are satisfied with your CSV file, save it as `deaths.csv` in your miniproject's data directory.

## Convert the data

The next step to a working website is to convert the CSV data you have made into a format known as JSON, which is by far the most common generic data format for Web applications. While this could probably be done with regular expressions, it is much easier to do with a small piece of programming.

I have provided a script in the `script` directory of the miniproject which you can use to do this. This is a Perl script, which can be run with the Perl interpreter in your shell:
  - The command is `perl`
  - The first argument is the path to the script
  - The second argument is the path to your `deaths.csv` file
  - The result will go to the standard output; you will want to redirect it to a file called `deaths.json` in your miniproject's data directory.

## Test out the webpage

Now look at the `index.html` page and think about what you expect to find. Once you have some idea, open that page in your browser. What do you see?

I have left some placeholder text for you to customize in the index.html page. Do this, and when you are satisfied, commit all the changes you have made so far to your Git repository and push them to Github.

## Activate Github Pages

Now on your miniproject's Github site, click 'Settings' near the top, and then scroll down until you find the 'Github Pages' section. Choose to publish from the main branch and the root of the repository and click 'Save'. (Don't worry about any of the options below.) Wait a few minutes, and your miniproject web page should soon be live on the Internet!

## Customize your functionality

Have a look at your page's Javascript in `main.js`. Try to understand some of what it does. Eventually you will find the regular expressions that control the table filtering when you push the colored buttons. Make up your own filters and set them up here! When you are satisfied, commit and push your changes again. You will soon see that your "live" web page updates!
