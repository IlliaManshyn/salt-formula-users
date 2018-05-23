users: 
 group.present:
    - name: dev 
    - gid: 2000 

 user.present:
  - name: canonical
  - home: /home/canonical
  - uid: 2000
  - groups:
    - devs
 
 redhat:
  user.absent

sshkey: 
 ssh_auth.present:
  - user: canonical
  - source: salt://ubuntu.pem.pub
  - config: '%h/.ssh/authorized_keys'


