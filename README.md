Role Name
=========

Installation of tools than any self-respecting C/C++ developer loves and needs.

Requirements
------------

TODO

Role Variables
--------------

* cpp_clion_install: true
* cpp_clion_version: 2016.2.3

Dependencies
------------

No dependencies.

Example Playbook
----------------

```
- hosts: servers
  roles:
      - { role: kurron.cpp-developer, cpp_clion_version: 2016.2.3 }
```

License
-------

This project is licensed under the [Apache License Version 2.0, January 2004](http://www.apache.org/licenses/).

Author Information
------------------

[Author's website](http://jvmguy.com/).
