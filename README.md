iis-packages-server Cookbook
========================
This cookbooks creates and configure a HTTP site on IIS in Windows 2012 R2 Serevr. This is serve files (ISO, MSI, exe, etc… ) on a Windows UNC network share path to a HTTP site. In Chef's "windows_package" resource it is easier to use a HTTP URL path then a Windows UNC network share path to reference installers.


Requirements
------------
This cookbook supports Chef 11.14.2
* .Net Framework 3.5

Platform
--------
* Windows 2012 R2 Server

Cookbooks
---------
* Windows
* iis

Attributes
----------
* default.iispackagesserver.shareaccess.username - enter an username here
* default.iispackagesserver.shareaccess.password - enter the password to the username above. Recommends using databags.
default.iispackagesserver.shareaccess.uncpath - <The UNC network path you want IIS site to point to>. Ex. '\\\\myNTshare.yourdomain.net\Packages'
* default.iispackagesserver.sitename - the name of your site


Usage
-----
You must supply your own user/password credentials, share path and site name for this to run.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[iis-packages-server]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github


License and Authors
-------------------
* Authors: Steve Dillon (steve.dillon@yaponcha.com)
* Contributor: Yeung Siu (yeung.siu@citrix.com)

Copyright:: 2015 Citrix Systems, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.