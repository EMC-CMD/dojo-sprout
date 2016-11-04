#
# Cookbook Name:: apt
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

apt_package 'jq' do
  action :install
end

apt_package 'git' do
  action :install
end
