#
# Cookbook Name:: re-pacakages-server
# Recipe:: default
#
# Copyright 2014, Citrix Systems, Inc
#
# All rights reserved - Do Not Redistribute
#


#Enable IIS

windows_feature "IIS-WebServerRole" do
  action :install
end
windows_feature "IIS-WebServer" do
  action :install
end

directory node.iispackagesserver.localfolder do
  action :create
end

directory node.iispackagesserver.localfoldersite do
  action :create
end

directory node.iispackagesserver.localfoldersitelogs do
  action :create
end

iis_config "/section:system.applicationHost/sites  /siteDefaults.logFile.directory:\"#{node.iispackagesserver.localfoldersitelogs}\"" do
  action :config
end

iis_site "Default Web Site" do
  action :delete
end


iis_pool node.iispackagesserver.sitename do
  action [:add]
  runtime_version "4.0"
  pipeline_mode :Integrated
end

#this is flaky, the :config action doesn't look at bindings, only port and protocol, so any real changes require you to delete
#the site.  I don't want to delete the site every chef run, so we just config the Add.  if you want to change bindings
#on an existing site you probably need to delete it, or do it manually , this is crap
iis_site node.iispackagesserver.sitename do 
  action [:add]
  site_name node.iispackagesserver.sitename
  path node.iispackagesserver.shareaccess.uncpath
  #instead of * you can put a dns name (my-packages-yourdomain.net) to get more than one web site on port 80
  bindings "http/*:80:,https/*:443:"
  application_pool node.iispackagesserver.sitename
end

#IIS logs on the user locally for the remote UNC share, so this user needs to exist on this machine to use the network share
user node.iispackagesserver.shareaccess.username do
  action [:create]
  password node.iispackagesserver.shareaccess.password

end

execute "set password" do
  command "c:\\Windows\\System32\\inetsrv\\appcmd.exe set site \"#{node.iispackagesserver.sitename}\" -virtualDirectoryDefaults.userName:#{node.iispackagesserver.shareaccess.username} -virtualDirectoryDefaults.password:#{node.iispackagesserver.shareaccess.password}"
end



iis_site node.iispackagesserver.sitename do
  action :start
end

