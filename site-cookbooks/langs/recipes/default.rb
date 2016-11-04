#
# Cookbook Name:: langs
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# apt_repository 'openjdk' do
#   uri             'ppa:openjdk/ppa'
# end
#
# apt_update 'update' do
#   action          :update
#   ignore_failure  true
# end
#
# apt_package "openjdk-7-jdk" do
#   action    :install
#   options   '--no-install-recommends'
# end



# remote_file '/tmp/golang.tar.gz' do
#   source  'https://storage.googleapis.com/golang/go1.7.3.linux-amd64.tar.gz'
#   checksum  '508028aac0654e993564b6e2014bf2d4a9751e3b286661b0b0040046cf18028e'
#   action  :create
# end

# execute 'tar -C /usr/local -zxf /tmp/golang.tar.gz'
# execute 'mkdir $HOME/workspace/gocode'

bash 'golang-env' do
  code <<-EOH
    echo 'export GOROOT=/usr/local/go' >> $HOME/.bash_profile
    echo 'export GOPATH=$HOME/workspace/gocode' >> $HOME/.bash_profile
    echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> $HOME/.bash_profile
  EOH
end
