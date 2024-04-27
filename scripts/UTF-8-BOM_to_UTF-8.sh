#!/bin/bash
# UTF-8-BOM => UTF-8
if [[ -z "$1" ]];then
    echo 'Usage: ./UTF-8-BOM_to_UTF-8.sh [folder | file]'
    echo 'Convert a UTF-8 with BOM encoded file to UTF-8 without BOM'
    exit 1
fi

for path in "$@"; do
    echo "Files under $path:"
    find $path -type f -name "*" -print0 | xargs -0 -I {} sh -c 'sed -i "1 s/^\xef\xbb\xbf//" "{}" && echo "Converted: {}"'
done
echo "Finished."
