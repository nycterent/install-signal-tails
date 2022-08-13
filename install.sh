#!/bin/bash

apt update
apt install -y apt-transport-https

wget --quiet --output-document - https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list


apt update
apt install -y signal-desktop

echo "#!/bin/bash" > /usr/local/bin/signal-desktop
echo "HTTPS_PROXY=socks5://127.0.0.1:9050 /opt/Signal/signal-desktop --no-sandbox" >> /usr/local/bin/signal-desktop

chmod +x /usr/local/bin/signal-desktop



