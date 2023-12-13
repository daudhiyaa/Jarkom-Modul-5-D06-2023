apt-get update
apt-get install isc-dhcp-server -y
echo "
# Defaults for isc-dhcp-server initscript
# sourced by /etc/init.d/isc-dhcp-server
# installed at /etc/default/isc-dhcp-server by the maintainer scripts

#
# This is a POSIX shell fragment
#

# Path to dhcpd's config file (default: /etc/dhcp/dhcpd.conf).
#DHCPD_CONF=/etc/dhcp/dhcpd.conf

# Path to dhcpd's PID file (default: /var/run/dhcpd.pid).
#DHCPD_PID=/var/run/dhcpd.pid

# Additional options to start dhcpd with.
#       Don't use options -cf or -pf here; use DHCPD_CONF/ DHCPD_PID instead
#OPTIONS=\"\"

# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
#       Separate multiple interfaces with spaces, e.g. \"eth0 eth1\".
INTERFACES=\"eth0\"
" >/etc/default/isc-dhcp-server

echo "
# A3
subnet 192.194.0.0 netmask 255.255.255.252 { }
# A4
subnet 192.194.0.4 netmask 255.255.255.252 { }
# A5
subnet 192.194.0.8 netmask 255.255.255.252 { }
# A6
subnet 192.194.0.12 netmask 255.255.255.252 { }
# A9
subnet 192.194.0.16 netmask 255.255.255.252 { }
# A10
subnet 192.194.0.20 netmask 255.255.255.252 { }

# SchwerMountain A8/25
subnet 192.194.0.128 netmask 255.255.255.128 {
  range 192.194.0.130 192.194.0.254;
  option routers 192.194.0.129;
  option broadcast-address 192.194.0.255;
  default-lease-time 600;
  max-lease-time 7200;
}

# LaubHills A7/23
subnet 192.194.2.0 netmask 255.255.254.0 {
  range 192.194.2.1 192.194.3.254;
  option routers 192.194.2.1;
  option broadcast-address 192.194.3.255;
  default-lease-time 600;
  max-lease-time 7200;
}

# TurkRegion A1/21
subnet 192.194.8.0 netmask 255.255.248.0 {
  range 192.194.8.1 192.194.15.254;
  option routers 192.194.8.1;
  option broadcast-address 192.194.15.255;
  default-lease-time 600;
  max-lease-time 7200;
}

# GrobeForest A2/22
subnet 192.194.4.0 netmask 255.255.252.0 {
  range 192.194.4.2 192.194.7.254;
  option routers 192.194.4.1;
  option broadcast-address 192.194.7.255;
  default-lease-time 600;
  max-lease-time 7200;
}
" >/etc/dhcp/dhcpd.conf

rm /var/run/dhcpd.pid
service isc-dhcp-server restart
service isc-dhcp-server status
