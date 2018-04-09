Markdown Resume
===================

Are you as tired of fussing with your resume as I am? Do you not want to mess with LaTeX for this random thing you need to do every couple of years? Are you tired of Microsoft Word destroying your formatting? I wrote this thing after scrambling to shove my resume into a new format for a grant submission. Hopefully it will make me happier in the future.

Markdown Resume takes Markdown formatted files and compiles them into a PDF file. Based on the contents of the Markdown and configurations you give it, you can make resumes with different sections in different orders. Then format the whole thing with CSS and hand it to whoever wants it.

Example resume with the test data (below): [test.pdf](test/test.pdf)


## Dependencies

Uses https://www.npmjs.com/package/markdown-pdf

    npm install -g markdown-pdf

Also requires bash. Tested on Ubuntu 16.04.

## Usage

For the most basic build:

    ./build_resume.sh DIR

Where DIR is the location of your Markdown files. They need to be named specifically

## No, really. Usage

More realistically, I have a directory in my Dropbox called MASTER with these files:
* Header : My name, contact details, social media and stuff
* Education : University education, professional development, and continuing education courses
* Employment : where I've worked
* Service : Stuff I've done outside the line of duty. Organizing events, sitting on committees, reviewing (I'm not an academic so this is a bonus), any other outreach activities
* Presentations : Talks I've given
* Publications : papers and posters

When I start a new resume, I'll copy all those files over to a new directory `NEW_DIR` and cut stuff out as necessary. Then

    ./build_resume NEW_DIR

And hopefully a new wild resume appears.

## Testing

I've included sample files in test/

    ./build_resume.sh test

It should create a file called test.pdf in the directory you give with the formatted resume.

## Licensing

[MIT](LICENSE)

## Troubleshooting

1. MaxListenersExceededWarning: Possible EventEmitter memory leak detected. 2 end listeners added. Use emitter.setMaxListeners() to increase limit

False alarm. Please disregard. Your PDF will still be generated. [Bug#98](https://github.com/alanshaw/markdown-pdf/issues/98)

