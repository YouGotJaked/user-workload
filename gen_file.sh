#!/bin/bash

#check arguments
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <SIZE> <BASE>" >&2
  exit 1
fi

out="$1$2.dat"

#test write speed, use sync to write data buffered in memory out to disk
sync; dd if=/dev/urandom of=/local/weka/$out count=1024 iflag=count_bytes; sync

#clear cached data from RAM so it is only read from disk, uncomment if root user
#sudo /sbin/sysctl -w vm.drop_caches=3

#test read speed
dd if=/local/weka/$out of=/dev/urandom count=1024 iflag=count_bytes

cat /dev/urandom | head -c $1$2 > /local/weka/$out

#display file size
du -h /local/weka/$out
