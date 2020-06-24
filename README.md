# Small Project Cilsy 1

## Topologi Jaringan
Berikut adalah gambar topologi jaringan yang digunakan dalam project ini.

![Topologi Jaringan](https://imgur.com/GLZBFtp.png "Topologi Jaringan Project 1")

## Vagrant File
Vagrant File digunakan untuk provision server yang digunakan dalam project ini, Spesifikasi yang digunakan didalam box Vagrant adalah sebagai berikut :
  * OS Ubuntu, menggunakan box **ubuntu/bionic64**
  * Memory 2048 Mb
  * Cpu 2
  
  
 ## Instalasi Script
 Menggunakan file **instalasi_webserver.sh**, Script ini digunakan untuk menginstall software sebagai berikut :
  * PHP
  * Mysql
  * Nginx
  
 ## File Konfigurasi nginx
 Menggunakan file **pesbuk.pro**, File ini digunakan untuk mengkonfigurasi virtual host, root folder, port, server name dan lain lain. 
  
  
 ## Petunjuk Penggunaan
  * Git Clone Project Ini
  * Masuk ke folder project, jalankan script.
   ```bash
   vagrant up
   ```
  * Setelah selesai, jalankan script
   ```bash
   vagrant ssh
   ```
   * Setelah masuk ke vagrant box, jalankan script
   ```bash
   sudo ./instalasi_webserver.sh
   sudo ./konfigurasi_nginx.sh
   ```
  * Konfigurasi Database
    - db user : **devopscilsy**
    - db host : **localhost**
    - db password : **1234567890**
    - db name : **dbsosmed**
  *  And Walla... Akses http://192.168.100.25/ untuk mengakses web pesbuk, atau akses http://pesbuk.pro jika anda sudah mendaftarkan domain di host anda.
