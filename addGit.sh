#!/bin/bash


echo "install Git for ubuntu"
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update > /dev/null
sudo apt-get install git -y  > /dev/null
echo "install Git LFS for ubuntu"
sudo apt-get install git-lfs -y  > /dev/null

