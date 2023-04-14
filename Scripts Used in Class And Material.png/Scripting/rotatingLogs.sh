#https://www.linode.com/docs/guides/solving-real-world-problems-with-bash-scripts-a-tutorial/
#!/bin/bash

f="/var/log/testfile.log"

if [ ! -f $f ]; then
    echo $f does not exist!
    exit
fi

touch ${f}
MAXSIZE=$((10 * 1024))

size=$(du -b ${f} | tr -s '\t' ' ' | cut -d' ' -f1)
if [ ${size} -gt ${MAXSIZE} ]; then
    echo Rotating!
    timestamp=$(date +%s)
    mv ${f} ${f}.$timestamp
    touch ${f}
fi
