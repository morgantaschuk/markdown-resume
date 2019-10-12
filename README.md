Markdown Resume
===================

Are you as tired of fussing with your resume as I am? Do you not want to mess with LaTeX for this random thing you need to do every couple of years? Are you tired of Microsoft Word destroying your formatting? I wrote this thing after scrambling to shove my resume into a new format for a grant submission. Hopefully it will make me happier in the future.

Markdown Resume takes Markdown formatted files and compiles them into a PDF file. Based on the contents of the Markdown and configurations you give it, you can make resumes with different sections in different orders. Then format the whole thing with CSS and hand it to whoever wants it.

Example resume with the test data (below): [test.pdf](test/test.pdf) [CoverLetter.pdf](test/CoverLetter.pdf)


## Dependencies

Uses https://www.npmjs.com/package/markdown-pdf

    npm install -g markdown-pdf

Also requires bash.

Tested on Ubuntu 16.04, 18.04, and MacOSX Mohave.

## Usage

For the most basic resume build:

    ./build_resume.sh DIR

Where DIR is the location of your Markdown files. They need to be named specifically.

If you want to build a cover letter:

    ./make_pdf.sh FILE

Where FILE is a Markdown file.

## No, really. Usage

More realistically, I have a directory in my Dropbox called MASTER with these files:
* Header : My name, contact details, social media and stuff
* Education : University education, professional development, and continuing education courses
* Employment : where I've worked
* Service : Stuff I've done outside the line of duty. Organizing events, sitting on committees, reviewing (I'm not an academic so this is a bonus), any other outreach activities
* Presentations : Talks I've given
* Publications : papers and posters
* CoverLetter : my general cover letter that I will carefully customize for each position.

When I start a new resume, I'll copy all those files over to a new directory `NEW_DIR` and cut stuff out as necessary. Then

    ./build_resume.sh NEW_DIR
    ./make_pdf. sh NEW_DIR/CoverLetter

And hopefully a new wild resume and cover letter appear.

## Testing

I've included sample files in test/

    ./build_resume.sh test
    ./make_pdf.sh test/CoverLetter

It should create two files called test.pdf and CoverLetter.pdf in the directory
you give with the formatted resume and cover letter.

## Bonus: Concatenate Cover Letter and Resume

Say you're only allowed to upload one file, and you've just spent three hours
writing the perfect cover letter. No problem! Concatenate those things together.

Dependency: Ghostscript

    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=Merged_CoverLetter_Resume.pdf CoverLetter.pdf Resume.pdf

Huzzah, a solution.

## Licensing

[MIT](LICENSE)

## Troubleshooting

1. MaxListenersExceededWarning: Possible EventEmitter memory leak detected. 2 end listeners added. Use emitter.setMaxListeners() to increase limit

False alarm. Please disregard. Your PDF will still be generated. [Bug#98](https://github.com/alanshaw/markdown-pdf/issues/98)
