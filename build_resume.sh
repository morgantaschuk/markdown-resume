#/bin/bash

set -aou pipefail

###############################
### Takes a bunch of appropriately named Markdown files and renders them into a PDF
### Usage: ./build_resume.sh DIR_WITH_MDS
###
### Error checking sufficient to prevent shooting self in foot
### Author: Morgan Taschuk
### Repository: https://github.com/morgantaschuk/markdown-resume
###############################


### Change these if different sections are needed. Ordering matters.
sections=( Header Employment Education Service Presentations Publications )

#get the directory this script is executing from
CURR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#absolute path, sadly Perl works on Ubuntu and Mac where readlink -f does not
DIR=$(perl -MCwd -e 'print Cwd::abs_path shift' $1)
TFILE="$(mktemp)"
OUT="${DIR}/$(basename $DIR).pdf"

if [[ ! -d "${DIR}" ]]; then
    echo "Error: Not a directory: ${DIR}"
    exit 1
fi


# cat all the files into a single .md tempfile
for section in ${sections[@]}; do
    SEC="${DIR}/${section}"
    if [ -e "${SEC}" ]; then
        cat "${SEC}" >> "${TFILE}"
        printf "\n" >> "${TFILE}"
    fi
done

# pdf it
cmd="markdown-pdf -s ${CURR}/default.css -o ${OUT} ${TFILE}"
echo $cmd
eval "${cmd}"
echo "Resume at ${OUT}"
