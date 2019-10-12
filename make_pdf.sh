#/bin/bash

set -aou pipefail

###############################
### Takes a Markdown file and renders it into a PDF
### Usage: ./make_pdf.sh MARKDOWN_FILE
###
### Author: Morgan Taschuk
### Repository: https://github.com/morgantaschuk/markdown-resume
###############################

#get the directory this script is executing from
CURR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#absolute path, sadly Perl works on Ubuntu and Mac where readlink -f does not
MDFILE=$(perl -MCwd -e 'print Cwd::abs_path shift' $1)
OUT="$(dirname $MDFILE)/$(basename $MDFILE).pdf"

if [[ ! -f "${MDFILE}" ]]; then
    echo "Error: Not a file: ${MDFILE}"
    exit 1
fi

cmd="markdown-pdf -s ${CURR}/default.css -o ${OUT} ${MDFILE}"
echo $cmd
eval "${cmd}"
echo "Document at ${OUT}"
