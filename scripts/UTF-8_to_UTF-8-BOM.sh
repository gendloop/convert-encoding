#!/bin/bash
# UTF-8 => UTF-8-BOM
if [[ -z "$1" ]];then
    echo 'Usage: ./UTF-8_to_UTF-8-BOM.sh [folder | file]'
    echo 'Convert a UTF-8 without BOM encoded file to UTF-8 with BOM'
    exit 1
fi

find $1 -type f -name "*" -print0 | xargs -0 -I {} sh -c 'sed -i "1 s/^/\xef\xbb\xbf&/" "{}" && echo "Converted: {}"'
echo "Finished."
