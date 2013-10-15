dnssec-keylist
==============

It is a shell script, that can list DNSSEC ZSK and KSK active or inactive.

$ ./listkey.sh (dir) (domain)
dir: 
  Those DNSSEC Keys(ZSK & KSK) in dir(directory).

domain:
  List only (domian) DNSSEC Keys.
  
Example:

[root@asus-srv4 dnssec-keylist]# ./listkey.sh /var/named/chroot/etc/dnskey/
====================================
*DN :
*NOW: 1381831611
====================================
Krsync.tw.+005+59091.key
 +----> (KSK)Always avaiable(UNSET Inactive Time)

Krsync.tw.+005+54391.key
 +----> (ZSK)Inactive

Krsync.tw.+005+45621.key
 +----> (KSK)Always avaiable(UNSET Inactive Time)
