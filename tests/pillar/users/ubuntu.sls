user:
 canonical:
  home: /home/canonical
  uid: 2000
  gid: 2020
  groups:
    - sudoers
  user_to_del: redhat
  group_name: sudoers 
  group_gid: 2020 
  ssh_key_path: salt://users
  ssh_public_key:
    - ubuntu.pem.pub
  ssh_private_key:
    - ubuntu.pem

