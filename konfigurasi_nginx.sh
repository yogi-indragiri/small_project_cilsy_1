#!/bin/bash
jawaban="y"
read -p "Apakah kamu yakin akan men setup konfigurasi nginx ? (y/n) " pilih;
if [ $pilih == $jawaban ];
then
    echo "Create User Mysql"
    read -p "user name: " user;
    read -p "host name: " host;
    read -p "password: " pass;

	echo "remove default nginx setup"
    sudo unlink /etc/nginx/sites-enabled/default
    sudo rm -R /var/www/html/*

    echo "Adding new configuration to pesbuk web"
    sudo cp pesbuk.pro /etc/nginx/sites-available
    sudo ln -s /etc/nginx/sites-available/pesbuk.pro /etc/nginx/sites-enabled/
    sudo systemctl reload nginx
    echo "Setup nginx selesai"

    # Create User DB
    echo "Create user $user..."
    sudo mysql -u root <<CREATE_USER
    create user '$user'@'$host' identified by '$pass';
    grant all privileges on *.* to '$user'@'$host';
CREATE_USER

    # Create DB and dump sql
    read -p "database name: " db;
    echo "Create Database $db..."
    sudo mysql -u $user -p$pass <<CREATEDB
    create database $db;
CREATEDB
    sudo mysql -u $user -p$pass $db < dump.sql
    echo "$db has been succesfully created!"

    echo "--Setup Finish !!!--"

    exit 0
else
    echo "Setup dibatalkan"
    exit 1
fi