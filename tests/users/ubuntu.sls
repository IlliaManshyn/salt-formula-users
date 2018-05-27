user:
 canonical: 
  home: /home/canonical
  uid: 2000
  gid: 2000
  groups:
    - sudoers
    - qwerty
  group_name: sudoers 
  group_gid: 2000 
  user_to_del: redhat
  ssh_key_path: salt://tests/users
  ssh_public_key: 
    - ubuntu.pem.pub
    - centos.pem.pub
  ssh_private_key:
    - ubuntu.pem 
    - centos.pem
