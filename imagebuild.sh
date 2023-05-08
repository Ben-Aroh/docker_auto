#!/bin/bash
#script to automate docker image build
#Author: Prof Elvis N
#Maintainer_Modified: Ben Aroh
#Company: Etech Consulting LLC
today=`date`
user=`whoami`
read -p "Please enter the dockerhub username: " dockeruser
read -s -p "Please enter dockerhub password: " password
#dockerrepo=https://hub.docker.com/repository/docker/benaroh/benapp
dockerrepo=benapp
versions=( 10.1.8 10.0.27 9.0.74 9.0.73 8.5.88 8.0.53 7.0.109 )
for i in ${versions[@]}; do
docker build -t $dockeruser/$dockerrepo:$i --build-arg versions=groovy .
docker login -u $dockeruser -p $password
docker push $dockeruser/$dockerrepo:$i
echo "$user is running a docker container with etechteam2/etecapp:$i on $today"
sleep 5
echo " Images have been uploaded to your dockerhub repository !! "
#if [ $i -eq 8.0.53 ]; then
#break
#echo " Number of images required have been uploaded to your dockerhub repository !! 
#fi
done
