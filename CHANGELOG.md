## v0.2.0
* Remove mirrorlist default if baseurl has been supplied
* Set RHEL/CentOS/etc 7 to use https urls
* Add test-kitchen serverspec and bats test
* Add Chefspec spec

## v0.1.1
* Switch from not_if to conditional resource declaration for consistency
* Include yum-epel in EL7 only if at least one webtatic repository is managed

## v0.1.0
* Added recipe for EL5/EL6/EL7 repositories