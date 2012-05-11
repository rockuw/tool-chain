sudo sysctl -w net.inet.ip.forwarding=1
sudo pfctl -e -f pf.conf
