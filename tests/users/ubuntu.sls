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

