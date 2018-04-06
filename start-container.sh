#!/bin/bash

# the default node number is 3
N=${1:-2}


# start hadoop master container
sudo docker rm -f master &> /dev/null
echo "start master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
                --name master \
                --hostname master \
                chunggil/hadoop:1.0 &> /dev/null


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f slave$i &> /dev/null
	echo "start slave$i container..."
	sudo docker run -itd \
	                --net=hadoop \
	                --name slave$i \
	                --hostname slave$i \
	                chunggil/hadoop:1.0 &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
sudo docker exec -it master bash
