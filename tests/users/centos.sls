group:
    - name: sudoers 
    - gid: 4000 

user:
  - name: redhat
  - home: /home/redhat
  - uid: 3000
  - groups:
    - sudoers

user_to_del:
 - name: canonical 

ssh_public_keys:
 - source: salt://tests/users/centos.pem.pub

ssh_private_keys:
 - source: salt://tests/users/centos.pem
