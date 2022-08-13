#!/bin/bash

apt update
apt install -y apt-transport-https

sudo -u amnesia wget --quiet --output-document - https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] tor+https://updates.signal.org/desktop/apt xenial main" | sudo tee /etc/apt/sources.list.d/signal-xenial.list


apt update
apt install -y signal-desktop

echo "#!/bin/bash"| tee /usr/local/bin/run-signal
echo "HTTPS_PROXY=socks5://127.0.0.1:9050 /opt/Signal/signal-desktop --no-sandbox" | tee -a /usr/local/bin/run-signal

chmod +x /usr/local/bin/run-signal



