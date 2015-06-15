name             'iis-packages-server'
maintainer       'Citrix Systems, inc'
maintainer_email 'yeung.siu@citrix.com'
license          'All rights reserved'
description      'This does basic small task configuration items for an orchestration server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'
supports		"windows"
depends			"windows"
depends         "iis"