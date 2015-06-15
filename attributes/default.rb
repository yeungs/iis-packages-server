#It is recommended to use Encrypted Databag for password
#
#Ex. svc_creds = Chef::EncryptedDataBagItem.load("passwords","serviceaccounts")
default.iispackagesserver.shareaccess.username = #<enter an username here>

# What, a clear text password.  This web site is going to share packages to the world
# with no authorization.  The user only has access to 
default.iispackagesserver.shareaccess.password = #<the password to the username above>. Recommend using databags. Ex. svc_creds['svcacct_repackages']


default.iispackagesserver.shareaccess.uncpath = #<The UNC network path you want IIS site to point to>. Ex. '\\\\myNTshare.yourdomain.net\Packages'


# name of the site
default.iispackagesserver.sitename = "my-packages"

default.iispackagesserver.localfolder = 'c:/websites'


default.iispackagesserver.localfoldersite = File.join(default.iispackagesserver.localfolder, default.iispackagesserver.sitename).gsub("/", "\\")
default.iispackagesserver.localfoldersitelogs = File.join(default.iispackagesserver.localfolder, "logs").gsub("/", "\\")
