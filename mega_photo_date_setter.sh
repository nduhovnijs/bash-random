#/bin/bash
SAVEIFS=$IFS; \
IFS=$(echo -en "\n\b"); \
cd ~/MEGA/Photo\ Archive; \
for dir in $(find ./* -type d | grep -E "[0-9]{4}_[0-9]{2}"); do \
    DATE=$(echo $dir | sed "s/\.\/[0-9][0-9][0-9][0-9]\///g" | sed "s/_//g"); \
    for file in $(ls $dir); do \
        NEWNAME=$(echo $file | sed "s/\s/_/g")
        mv "${dir}/${file}" "${dir}/${DATE}_${NEWNAME}"; \
    done; \
    touch -d "${DATE}01" $dir/*; \
done; \
for file in $(find ./* -type f); do cp --preserve=timestamps $file ~/MEGA/Camera\ Uploads/; done; \
IFS=$SAVEIFS;