#!/bin/bash

jawaban="y"

read -p "Apakah kamu yakin akan menginstall php, nginx dan mysql ? (y/n) " pilih;
if [ $pilih == $jawaban ];
then
    echo "Update ubuntu"
    sudo apt-get update
    echo "Melakukan Installasi Nginx"
    sudo apt-get install -y nginx 
	echo "Melakukan instalasi php dan ekstensinya"
    sudo apt-get install -y php-fpm php-mysql
    echo "Melakukan Installasi Database Server"
    sudo apt-get install -y mysql-server
    echo "Installasi Selesai"
exit 0 
else
    echo "Installasi dibatalkan"
exit 1 

fi

