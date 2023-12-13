apt-get update
apt-get install isc-dhcp-relay -y
service isc-dhcp-relay start

echo '
SERVERS="192.194.0.22" # IP Revolte - DHCP Server
INTERFACES="eth0 eth1 eth2"
OPTIONS=""
' >/etc/default/isc-dhcp-relay

echo '
net.ipv4.ip_forward=1
' >/etc/sysctl.conf

service isc-dhcp-relay restart
