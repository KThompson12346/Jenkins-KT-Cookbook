#
# Cookbook:: Jenkins-KT-Cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
# Update the sources list
apt_update ("update") do
  action :update
end

# Add JavaDK 8 repo to list of repos
apt_repository ("JavaDK8") do
  uri "ppa:webupd8team/java"
  action :add
end

# Install java 8
package ("openjdk-8-jdk") do
  action :install
end

# Add Jenkins repo
apt_repository ("Jenkins_repo") do
  key "https://pkg.jenkins.io/debian/jenkins.io.key"
  uri "http://pkg.jenkins.io/debian-stable"
  distribution "binary/"
  action :add
end

# Update sources list after installing Jenkins
apt_update ("update") do
  action :update
end

# Install Jenkins
package ("jenkins") do
  action :install
end

# Start Jenkins
service ("jenkins") do
  action [:enable, :start]
end
