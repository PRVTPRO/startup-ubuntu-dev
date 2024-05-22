# Update system Ubuntu 22.04
sudo apt update && sudo apt upgrade -y

# Install base lib
sudo apt install nano curl

# Docker install
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install docker lib
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# Test docker 
sudo docker run hello-world
#End  Docker install

# Install portainer
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
# End install portainer

# Start tests system
wget https://cdn.geekbench.com/Geekbench-6.2.1-Linux.tar.gz
tar xf Geekbench-6.2.1-Linux.tar.gz
./Geekbench-6.2.1-Linux/geekbench6 > Geekbench.log

rm Geekbench-6.2.1-Linux.tar.gz
rm -r Geekbench-6.2.1-Linux
# End tests system

# Start tests network
sudo apt-get install curl
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt-get install speedtest
sudo speedtest --accept-license
sudo speedtest --accept-gdpr
sudo speedtest > speedtest.log
# End tests network
