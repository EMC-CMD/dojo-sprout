# create workspace
mkdir -p ~/workspace

# make a temp directory for all this work
mkdir -p ~/workspace/tmp/dojo-install
cd ~/workspace/tmp/dojo-install


############################# BASIC #############################
sudo apt-get update
sudo apt-get install -y \
									   git \
										 terminator \
										 vim \
										 virtualbox \
										 vagrant

# bash-it
git clone https://github.com/Bash-it/bash-it.git
pushd bash-it
	chmod a+x install.sh
	./install.sh --silent
popd
rm bash-it
source ~/.bashrc
bash-it enable alias clipboard general git
source ~/.bashrc
rm -rf bash-it/

# git-duet
mkdir -p git-duet
pushd git-duet
	wget --no-check-certificate https://github.com/git-duet/git-duet/releases/download/0.5.0/linux_amd64.tar.gz
	tar -xvf linux_amd64.tar.gz
	rm linux_amd64.tar.gz
	chmod a+x ./*
	mv ./* /usr/local/bin
popd
rm -rf git-duet/


############################# LANGUAGE #############################
# Java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer

# gvm
bash < <(curl -s -k -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# Go
gvm install go1.9
gvm use go1.9

# Ruby
sudo apt-get install -y ruby ruby-dev
source ~/.bashrc

# Python
sudo apt install -y \
								 python python-dev python-pip \
								 python3 python3-dev python3-pip


############################# TOOL #############################
# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce

# Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get install -y google-chrome-stable


############################# CLI #############################
# kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# cf
mkdir -p cf-cli
pushd cf-cli
	wget --no-check-certificate https://cli.run.pivotal.io/stable?release=debian64&version=6.22.2&source=github-rel
	dpkg -i cf-cli-installer_6.22.2_x86-64.deb && apt-get install -f
popd
rm -rf cf-cli

# bosh v2
wget https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.40-linux-amd64 -O bosh
chmod +x bosh
sudo mv bosh /usr/local/bin/bosh


############################# FRAMWORK #############################
# NodeJS
sudo apt-get install -y nodejs


############################# EDITOR #############################
# Atom
sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install -y atom
