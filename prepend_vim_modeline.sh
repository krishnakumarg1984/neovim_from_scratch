#!/bin/bash
# vim: nomodeline

LUA_FILES=$(find . -name "*.lua")

for file in $LUA_FILES
do
    # echo "$file"
    modeline_string="-- vim: foldmarker=(((,))):foldmethod=marker:foldlevel=0:shiftwidth=2:softtabstop=2:tabstop=2"
    # https://stackoverflow.com/questions/3557037/appending-a-line-to-a-file-only-if-it-does-not-already-exist
    # grep -qxF "$file" # || echo 'include "/configs/projectname.conf"' >> foo.bar
    grep -qxF -- "$modeline_string" "$file" || sed -i "1i $modeline_string\n" $file
done

