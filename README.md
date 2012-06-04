REQUIREMENTS
============

Platform
--------

Any recent debian (inlcuding ubuntus), maybe other linuxes

Cookbooks
---------

- build-essential
- java
- zeromq (https://github.com/pyronicide/zeromq-cookbook)

ATTRIBUTES
==========

* `node[:jzmq][:install_dir]` - location to install jzmq to (defaults to /usr/local)
* `node[:jzmq][:src_mirror]` - full URL to download the source from. (defaults to github trunk tarball)
* `node[:jzmq][:zeromq_install_dir]` - location zeromq lib was installed to (defaults to /usr/local), see zeromq cookbook

RECIPES
=======

default
-------

Installs jzmq and configures it.


LICENSE AND AUTHOR
==================

Author:: 

Copyright 2012,

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.


