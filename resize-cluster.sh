#!/bin/bash

# N is the node number of hadoop cluster
N=$1

if [ $# = 0 ]
then
	echo "Please specify the node number of hadoop cluster!"
	exit 1
fi

# change slaves file
i=1
rm config/slaves
while [ $i -lt $N ]
do
	echo "slave$i" >> config/slaves
	((i++))
done 

echo ""

echo -e "\nbuild docker hadoop image\n"

# rebuild chunggil/hadoop image
sudo docker build -t chunggil/hadoop:1.0 .

echo ""
