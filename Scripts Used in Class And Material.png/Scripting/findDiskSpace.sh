#https://www.linode.com/docs/guides/solving-real-world-problems-with-bash-scripts-a-tutorial/
#!/bin/bash

# default value to use if none specified
PERCENT=30

# test for command line arguement is present
if [[ $# -le 0 ]]; then
    printf "Using default value for threshold!\n"
# test if argument is an integer
# if it is, use that as percent, if not use default
else
    if [[ $1 =~ ^-?[0-9]+([0-9]+)?$ ]]; then
        PERCENT=$1
    fi
fi

#let "PERCENT += 0"
#printf "Threshold = %d\n" $PERCENT
echo "Threshold = $PERCENT"
df -Ph | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5,$1 }' | while read data; do
    usedspace=$(echo $data | awk '{print $1}' | sed s/%//g)
    partition=$(echo $data | awk '{print $2}')
    if [ $usedspace -ge $PERCENT ]; then
        echo "WARNING: The partition \"$partition\" has used $usedspace% of total available space - Date: $(date)"
    fi
done
