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

