#/bin/bash

set -aou pipefail

###############################
### Takes a bunch of appropriately named Markdown files and renders them into a PDF
### Usage: ./build_resume.sh DIR_WITH_MDS
###
### Error checking sufficient to prevent shooting self in foot
### Author: Morgan Taschuk
###############################


### Change these if different sections are needed. Ordering matters.
sections=( Header Education Employment Service Presentations Publications )


DIR=$(readlink -f $1)
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
cmd="markdown-pdf -s default.css -o ${OUT} ${TFILE}"
echo $cmd
eval "${cmd}"
echo "Resume at ${OUT}"
