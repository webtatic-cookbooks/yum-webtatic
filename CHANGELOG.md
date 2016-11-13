## v0.7.0
* Switch el6 to renamed user id gpg key

## v0.6.0
* Update to require yum-epel for all repository releases

## v0.5.0
* Use http on EL5 versions

## v0.4.0
* Use https on all EL versions
* Disable sslverify on EL5 as it's ciphers are too out of date

## v0.3.0
* Switch to failover = priority and use mirrorlist rewrite

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
