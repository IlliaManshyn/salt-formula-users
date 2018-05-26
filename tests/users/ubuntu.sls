group:
    - name: sudoers 
    - gid: 2000 

user:
  - name: canonical
  - home: /home/canonical
  - uid: 2000
  - groups:
    - sudoers

user_to_del:
 - name: redhat

ssh_public_keys:
  source: salt://tests/users/ubuntu.pem.pub

ssh_private_keys:
  source: salt://tests/users/ubuntu.pem
