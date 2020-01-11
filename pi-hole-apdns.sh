#!/bin/bash
echo "========================================================="
echo "==!! Pi-Hole : Android Private DNS Configuration !!=="
echo "========================================================="
echo ""
#echo "Chaning Location To /tmp/"
#cd /tmp/
echo ""
echo "============="
echo "Install cloudflared for DNS Over HTTPS ? "
echo "(y)es or (N)o"
echo "============="
read cloudflaredinstall
if [ "$cloudflaredinstall" = "y" ] || [ "$cloudflaredinstall" = "Y" ]; then
	wget https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb
	sudo chmod +x ./cloudflared-stable-linux-amd64.deb
	sudo apt-get install ./cloudflared-stable-linux-amd64.deb
	sudo useradd -s /usr/sbin/nologin -r -M cloudflared
	sudo touch /etc/default/cloudflared
	sudo touch /etc/systemd/system/cloudflared.service
	echo "
# Commandline args for cloudflared
CLOUDFLARED_OPTS=--port 5053 --upstream https://1.1.1.1/dns-query --upstream https://1.0.0.1/dns-query
	" > /etc/default/cloudflared
	
	echo "
[Unit]
Description=cloudflared DNS over HTTPS proxy
After=syslog.target network-online.target

[Service]
Type=simple
User=cloudflared
EnvironmentFile=/etc/default/cloudflared
ExecStart=/usr/local/bin/cloudflared proxy-dns $CLOUDFLARED_OPTS
Restart=on-failure
RestartSec=10
KillMode=process

[Install]
WantedBy=multi-user.target
	" > /etc/systemd/system/cloudflared.service

	sudo chown cloudflared:cloudflared /etc/default/cloudflared
	sudo chown cloudflared:cloudflared /usr/local/bin/cloudflared
	sudo systemctl unmask cloudflared
	sudo systemctl enable cloudflared
	sudo systemctl start cloudflared
	sudo systemctl status cloudflared
fi
