#make a temp directory for all this work
mkdir -p ~/tmp/dojo-install
cd ~/tmp/dojo-install
#install Git first.

sudo apt-get update
sudo apt-get install git

#install bash-it, our fav bash environment

git clone https://github.com/Bash-it/bash-it.git

pushd bash-it
	chmod a+x install.sh
	./install.sh
popd
rm bash-it
source ~/.bashrc
bash-it enable alias clipboard fuck general git
source ~/.bashrc
rm -rf bash-it/

#install git-duet

mkdir -p git-duet

pushd git-duet
	wget --no-check-certificate https://github.com/git-duet/git-duet/releases/download/0.5.0/linux_amd64.tar.gz
	tar -xvf linux_amd64.tar.gz
	rm linux_amd64.tar.gz
	chmod a+x ./*
	mv ./* /usr/local/bin
popd

rm -rf git-duet/

#install terminator

sudo apt-get install terminator

#install atom

sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install atom

#install gvm

bash < <(curl -s -k -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

#install version of go

gvm install go1.7.3
gvm use go1.7.3

#install ruby

sudo apt-get install ruby
sudo apt-get install ruby-dev
source ~/.bashrc

#install BOSH cli

gem install bosh_cli --no-ri --no-rdoc

#install CF Cli

mkdir -p cf-cli

pushd cf-cli
	wget --no-check-certificate https://cli.run.pivotal.io/stable?release=debian64&version=6.22.2&source=github-rel
	dpkg -i cf-cli-installer_6.22.2_x86-64.deb && apt-get install -f
popd

rm -rf cf-cli

#install thefuck (bonus: python)

sudo apt update
sudo apt install python3-dev python3-pip
sudo -H pip3 install thefuck

#install virtualbox/vagrant

sudo apt-get install virtualbox
sudo apt-get install vagrant

#install nodejs

sudo apt-get install nodejs


