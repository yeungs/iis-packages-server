name             'iis-packages-server'
maintainer       'Citrix Systems, inc'
maintainer_email 'yeung.siu@citrix.com'
license          'All rights reserved'
description      'This cookbooks creates and configure a HTTP site on IIS in Windows 2012 R2 Server for a Windows UNC network share.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.2'
supports		"windows"
depends			"windows"
depends         "iis"