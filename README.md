# <div align="center"><p>Jarkom-Modul-5-D06-2023</p></div>

## Anggota Kelompok

| Nama                               | NRP        |
| ---------------------------------- | ---------- |
| Achmad Khosyi’ Assajjad Ramandanta | 5025211007 |
| Daud Dhiya' Rozaan                 | 5025211021 |

## Introduction

Untuk menyelesaikan praktikum 5 jaringan komputer ini,pertama-tama, kita harus melakukan konfigurasi awal agar topologi dapat terhubung antar satu node dgn yg lain menggunakan teknik `subnetting` dan `routing`, dan juga agar dapat terhubung dengan internet luar

## Subnetting

### Link Spreadsheet Perhitungan

Berikut merupakan link spreadsheet penentuan rute & perhitungan subnet menggunakan metode `VLSM` : [Link Spreadsheet Perhitungan](https://docs.google.com/spreadsheets/d/1U3YAlXMqIkapLcp48UgTTKwQGk3bb3ifIKzRlXlVnas/edit#gid=638239655)

### Pembagian Subnet

![Alt text](images/subnet.png)

### VSLM Tree

![Alt text](images/tree.jpg)

## Setup Configuration

Selanjutnya, lakukan konfigurasi untuk setiap node

### Aura

```sh
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 192.194.0.1
	netmask 255.255.255.252

auto eth2
iface eth2 inet static
	address 192.194.0.5
	netmask 255.255.255.252

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Heiter

```sh
auto eth0
iface eth0 inet static
	address 192.194.0.2
	netmask 255.255.255.252
	gateway 192.194.0.1

auto eth1
iface eth1 inet static
	address 192.194.8.1
	netmask 255.255.248.0

auto eth2
iface eth2 inet static
	address 192.194.4.1
	netmask 255.255.252.0

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### TurkRegion

```sh
auto eth0
iface eth0 inet static
	address 192.194.8.2
	netmask 255.255.248.0
	gateway 192.194.8.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Sein

```sh
auto eth0
iface eth0 inet static
	address 192.194.4.2
	netmask 255.255.252.0
	gateway 192.194.4.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### GrobeForest

```sh
auto eth0
iface eth0 inet static
	address 192.194.4.3
	netmask 255.255.252.0
	gateway 192.194.4.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Frieren

```sh
auto eth0
iface eth0 inet static
	address 192.194.0.6
	netmask 255.255.255.252
	gateway 192.194.0.5

auto eth1
iface eth1 inet static
	address 192.194.0.9
	netmask 255.255.255.252

auto eth2
iface eth2 inet static
	address 192.194.0.13
	netmask 255.255.255.252

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Stark

```sh
auto eth0
iface eth0 inet static
	address 192.194.0.10
	netmask 255.255.255.252
	gateway 192.194.0.9

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Himmel

```sh
auto eth0
iface eth0 inet static
	address 192.194.0.14
	netmask 255.255.255.252
	gateway 192.194.0.13

auto eth1
iface eth1 inet static
	address 192.194.2.1
	netmask 255.255.254.0

auto eth2
iface eth2 inet static
	address 192.194.0.129
	netmask 255.255.255.128

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### LaubHills

```sh
auto eth0
iface eth0 inet static
	address 192.194.2.2
	netmask 255.255.254.0
	gateway 192.194.2.1

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Fern

```sh
auto eth0
iface eth0 inet static
	address 192.194.0.130
	netmask 255.255.255.128
	gateway 192.194.0.129

auto eth1
iface eth1 inet static
	address 192.194.0.17
	netmask 255.255.255.252

auto eth2
iface eth2 inet static
	address 192.194.0.21
	netmask 255.255.255.252

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### SchwerMountain

```sh
auto eth0
iface eth0 inet static
	address 192.194.0.131
	netmask 255.255.255.128
	gateway 192.194.0.129

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Richter

```sh
auto eth0
iface eth0 inet static
	address 192.194.0.18
	netmask 255.255.255.252
	gateway 192.194.0.17

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

### Richter

```sh
auto eth0
iface eth0 inet static
	address 192.194.0.22
	netmask 255.255.255.252
	gateway 192.194.0.21

up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

## Routing

Setelah subnetting dan setup untuk konfigurasi tiap node selesai, lalu lakukan routing dengan menjalankan command-command ini

### Di Aura

```sh
# Heiter
up route add -net 192.194.8.0 netmask 255.255.248.0 gw 192.194.0.2 # A1
up route add -net 192.194.4.0 netmask 255.255.252.0 gw 192.194.0.2 # A2
# Frieren
up route add -net 192.194.0.8 netmask 255.255.255.252 gw 192.194.0.6 # A5
up route add -net 192.194.0.12 netmask 255.255.255.252 gw 192.194.0.6 # A6
up route add -net 192.194.2.0 netmask 255.255.254.0 gw 192.194.0.6 # A7
up route add -net 192.194.0.128 netmask 255.255.255.128 gw 192.194.0.6 # A8
up route add -net 192.194.0.16 netmask 255.255.255.252 gw 192.194.0.6 # A9
up route add -net 192.194.0.20 netmask 255.255.255.252 gw 192.194.0.6 # A10
```

### Di Frieren

```sh
up route add -net 192.194.2.0 netmask 255.255.254.0 gw 192.194.0.14 # A7
up route add -net 192.194.0.128 netmask 255.255.255.128 gw 192.194.0.14 # A8
up route add -net 192.194.0.16 netmask 255.255.255.252 gw 192.194.0.14 # A9
up route add -net 192.194.0.20 netmask 255.255.255.252 gw 192.194.0.14 # A10
```

### Di Himmel

```sh
up route add -net 192.194.0.16 netmask 255.255.255.252 gw 192.194.0.130 # A9
up route add -net 192.194.0.20 netmask 255.255.255.252 gw 192.194.0.130 # A10
```

Untuk routing kita hanya perlu melakukannya di 3 Router, karena 3 Router tersebut lah yang merupakan 'parent' dari subnet-subnet di bawahnya

## DHCP

Lalu kita lakukan setup untuk DHCP Server, Relay, & Client agar Client dapat menerima IP secara dinamis menggunakan DHCP

### [Link Setup DHCP](https://github.com/daudhiyaa/Jarkom-Modul-5-D06-2023/tree/main/0)

**Hasil**

![Alt text](images/image-1.png)

## No 1

**Soal**

Agar topologi yang kalian buat dapat mengakses keluar, kalian diminta untuk mengkonfigurasi Aura menggunakan iptables, tetapi tidak ingin menggunakan MASQUERADE.

**Jawab**

Agar topologi dapat mengakses internet dari luar tanpa menggunakan MASQUERADE, kita bisa menjalankan command ini di `Aura`

```sh
ETH0_IP=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $ETH0_IP
```

## No 2

**Soal**

Kalian diminta untuk melakukan drop semua TCP dan UDP kecuali port 8080 pada TCP.

**Jawab**

Jalnkan command ini di salah satu client (Contoh disini adalah menggunakan `LaubHills`)

```sh
echo nameserver 192.168.122.1 >/etc/resolv.conf

apt-get update
apt-get install netcat -y

ROOT_IP="192.194.0.0/20"

# acc port 8080 pada TCP
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
# drop semua TCP dan UDP
iptables -A INPUT -p tcp -j DROP
iptables -A INPUT -p udp -s $ROOT_IP -j DROP
```

**Testing**

Jalankan command ini di `LaubHills` sebagai listener untuk semua message yang menggunakan port 8080

```sh
nc -lvp 8080
```

Lalu buka terminal baru, dan jalankan command ini di client selain `LaubHills` sebagai publisher menggunakan port 8080

```sh
apt-get update
apt-get install netcat -y

IP_LAUBHILLS=""
nc $IP_LAUBHILLS 8080
```

**Hasil**

![Alt text](images/image.png)

## No 3

**Soal**

Kepala Suku North Area meminta kalian untuk membatasi DHCP dan DNS Server hanya dapat dilakukan ping oleh maksimal 3 device secara bersamaan, selebihnya akan di drop.

**Jawab**

Jalankan Command ini di DHCP Server & DNS Server

```sh
MAX_DEVICES=3
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p icmp -m connlimit --connlimit-above $MAX_DEVICES --connlimit-mask 0 -j DROP
```

_Keterangan_: Untuk membatasi berapa device yang dapat melakukan ping ke suatu node, kita dapat menggunakan argumen `connlimit --connlimit-above $MAX_DEVICES` pada command `iptables`, dengan `$MAX_DEVICES` adalah maximum device yang dapat melakukan ping ke suatu node tersebut

**Testing**

Lalu lakukan testing di lebih dari 3 client

```sh
IP_DHCP_SERVER=""
IP_DNS_SERVER=""

ping $IP_DHCP_SERVER
ping $IP_DNS_SERVER
```

**Hasil**

Ping 4 Device ke DHCP Server

![Alt text](images/image-2.png)

Ping 4 Device ke DNS Server

![Alt text](images/image-3.png)

## No 4

**Soal**

Lakukan pembatasan sehingga koneksi SSH pada Web Server hanya dapat dilakukan oleh masyarakat yang berada pada GrobeForest

**Jawab**

Jalankan Command ini di Web Server (`Sein` & `Stark`)

```sh
NID_SUBNET_GROBEFOREST="192.194.4.0/22"
# command untuk menerima dari GrobeForest
iptables -A INPUT -p tcp --dport 22 -s $NID_SUBNET_GROBEFOREST -j ACCEPT
# command untuk menolak selain dari GrobeForest
iptables -A INPUT -p tcp --dport 22 -j DROP
```

_Keterangan_ : 22 adalah port untuk SSH

**Testing**

```sh
# Di Web Server
nc -lvp 22

# Di GrobeForest & Client lainnya ke Sein
IP_SEIN="192.194.4.2"
nmap $IP_SEIN 22

# Di GrobeForest & Client lainnya ke Stark
IP_STARK="192.194.0.10"
nmap $IP_STARK 22
```

**Hasil**

Ke Sein

![Alt text](images/image-4.png)

Ke Stark

![Alt text](images/image-5.png)

## No 5

**Soal**

Selain itu, akses menuju WebServer hanya diperbolehkan saat jam kerja yaitu Senin-Jumat pada pukul 08.00-16.00.

**Jawab**

Jalankan Command ini di Web Server (`Sein` & `Stark`)

```sh
# accept(terima) akses pada jam kerja
iptables -A INPUT -p tcp --dport 22 -m time --weekdays Mon,Tue,Wed,Thu,Fri --timestart 08:00 --timestop 16:00 -j ACCEPT
```

_Keterangan_:

- `--dport 22`: port SSH
- `--weekdays Mon,Tue,Wed,Thu,Fri`: Hari yang ditentukan
- `--timestart 08:00`: waktu mulai
- `--timestop 16:00`: waktu selesai

**Testing**

```sh
# Di Web Server
nc -lvp 22

# Di GrobeForest & Client lainnya ke Sein
IP_SEIN="192.194.4.2"
nmap $IP_SEIN 22

# Di GrobeForest & Client lainnya ke Stark
IP_STARK="192.194.0.10"
nmap $IP_STARK 22
```

**Hasil**

Ke Stark

![Alt text](images/image-6.png)

Ke Sein

![Alt text](images/image-7.png)

## No 6

**Soal**

Lalu, karena ternyata terdapat beberapa waktu di mana network administrator dari WebServer tidak bisa stand by, sehingga perlu ditambahkan rule bahwa akses pada hari Senin - Kamis pada jam 12.00 - 13.00 dilarang (istirahat maksi cuy) dan akses di hari Jumat pada jam 11.00 - 13.00 juga dilarang (maklum, Jumatan rek)

**Jawab**

Jalankan Command ini di Web Server (`Sein` & `Stark`)

```sh
# Bersihkan semua rules iptables
iptables -F

# drop untuk waktu makang siang
iptables -A INPUT -p tcp --dport 22 -m time --weekdays Mon,Tue,Wed,Thu --timestart 12:00 --timestop 13:00 -j DROP
# drop untuk waktu jumatan
iptables -A INPUT -p tcp --dport 22 -m time --weekdays Fri --timestart 11:00 --timestop 13:00 -j DROP

# rules dari no 4 & 5
NID_SUBNET_GROBEFOREST="192.194.4.0/22"
iptables -A INPUT -p tcp --dport 22 -m time --weekdays Mon,Tue,Wed,Thu,Fri --timestart 08:00 --timestop 16:00 -s $NID_SUBNET_GROBEFOREST -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j DROP
```

**Testing**

```sh
# Di Web Server
nc -lvp 22

# Di GrobeForest & Client lainnya ke Sein
IP_SEIN="192.194.4.2"
nmap $IP_SEIN 22

# Di GrobeForest & Client lainnya ke Stark
IP_STARK="192.194.0.10"
nmap $IP_STARK 22
```

**Hasil**

Rules IPTables

![Alt text](images/image-8.png)

Jika Saat Jam Makan Siang

![Alt text](images/image-9.png)

Jika Tidak Saat Jam Makan Siang

![Alt text](images/image-10.png)

## No 7

**Soal**

Karena terdapat 2 WebServer, kalian diminta agar setiap client yang mengakses Sein dengan Port 80 akan didistribusikan secara bergantian pada Sein dan Stark secara berurutan dan request dari client yang mengakses Stark dengan port 443 akan didistribusikan secara bergantian pada Sein dan Stark secara berurutan.

**Jawab**

Jalankan Command ini di Heiter, karena Heiter adalah salah satu router yang menyambung ke web server

```sh
IP_SEIN="192.194.4.2"
IP_STARK="192.194.0.10"

iptables -A PREROUTING -t nat -p tcp --dport 80 -d $IP_SEIN -m statistic --mode nth --every 2 --packet 0 -j DNAT --to-destination $IP_SEIN

iptables -A PREROUTING -t nat -p tcp --dport 80 -d $IP_SEIN -j DNAT --to-destination $IP_STARK

iptables -A PREROUTING -t nat -p tcp --dport 443 -d $IP_STARK -m statistic --mode nth --every 2 --packet 0 -j DNAT --to-destination $IP_STARK

iptables -A PREROUTING -t nat -p tcp --dport 443 -d $IP_STARK -j DNAT --to-destination $IP_SEIN
```

**Testing** Untuk Port 80

```sh
# Di Sein
while true; do nc -l -p 80 -c 'echo "Ini Dari Sein"'; done
# Di Stark
while true; do nc -l -p 80 -c 'echo "Ini Dari Stark"'; done
```

**Testing** Untuk Port 443

```sh
# Di Sein
while true; do nc -l -p 443 -c 'echo "Ini Dari Sein"'; done
# Di Stark
while true; do nc -l -p 443 -c 'echo "Ini Dari Stark"'; done
```

**Hasil**

## No 8

**Soal**

Karena berbeda koalisi politik, maka subnet dengan masyarakat yang berada pada Revolte dilarang keras mengakses WebServer hingga masa pencoblosan pemilu kepala suku 2024 berakhir. Masa pemilu (hingga pemungutan dan penghitungan suara selesai) kepala suku bersamaan dengan masa pemilu Presiden dan Wakil Presiden Indonesia 2024.

**Jawab**

Jalankan Command ini di Web Server (`Sein` & `Stark`)

```sh
IP_SUBNET_REVOLTE="192.194.0.20/30"
MULAI_MASA_PEMILU=$(date -d "2023-10-19T00:00" +"%Y-%m-%dT%H:%M")
SELESAI_MASA_PEMILU=$(date -d "2024-02-15T00:00" +"%Y-%m-%dT%H:%M")

# Atur waktu untuk masa pemilu
iptables -A INPUT -p tcp -s $IP_SUBNET_REVOLTE --dport 80 -m time --datestart "$MULAI_MASA_PEMILU" --datestop "$SELESAI_MASA_PEMILU" -j DROP
```

**Testing** di Revolte

```sh
# Ke Sein
IP_SEIN="192.194.4.2"
nmap $IP_SEIN 22

# Ke Stark
IP_STARK="192.194.0.10"
nmap $IP_STARK 22
```

**Hasil**

![Alt text](images/image-11.png)

## No 9

**Soal**

Sadar akan adanya potensial saling serang antar kubu politik, maka WebServer harus dapat secara otomatis memblokir alamat IP yang melakukan scanning port dalam jumlah banyak (maksimal 20 scan port) di dalam selang waktu 10 menit.
(clue: test dengan nmap)

**Jawab**

Jalankan Command ini di Web Server (`Sein` & `Stark`)

```sh
iptables -N portscan

iptables -A INPUT -m recent --name portscan --update --seconds 600 --hitcount 20 -j DROP
iptables -A FORWARD -m recent --name portscan --update --seconds 600 --hitcount 20 -j DROP

iptables -A INPUT -m recent --name portscan --set -j ACCEPT
iptables -A FORWARD -m recent --name portscan --set -j ACCEPT
```

**Testing**

Lakukan ping ke IP WebServer (`Sein` / `Stark`) di salah satu client

```sh
ping [IP_WebServer]
```

**Hasil**

## No 10

**Soal**

Karena kepala suku ingin tau paket apa saja yang di-drop, maka di setiap node server dan router ditambahkan logging paket yang di-drop dengan standard syslog level.

**Jawab**

```sh

```

**Hasil**
