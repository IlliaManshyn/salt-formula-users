user:
 redhat:
  home: /home/redhat
  uid: 5000
  gid: 5020
  groups:
    - sudoers
  user_to_del: canonical
  group_name: sudoers 
  group_gid: 5020 
  ssh_key_path: salt://tests
  ssh_public_key:
    - centos.pem.pub
  ssh_private_key:
    - centos.pem

