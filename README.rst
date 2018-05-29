To start working with this formula you should add to /etc/salt/master following lines:

To add root dir:
file_roots:
  base:
     - /home/user_name/salt-formula-users

To add pillar root-dir: 
pillar_roots:
 base:
  - /home/user_name/salt-formula-users/tests/pillar


To start formula use following command:
salt "*" state.sls users.init

In pillars you can: 
Set user data by changing args in ID: user
	name: - to set username 
	home: - to set user home dir
	uid: - to set user id
	gid: - to set group id for user
	groups: - to add user in groups

To create group:
	group_name: - to set group name
	group_gid: - to set group id

Delete any user:
	user_to_del: - to set username

Set path to ssh keys:
        ssh_key_path: - path to keys from salt root dir

Set name of the public key(s):
        ssh_public_key: - name of public key(s)

Set name of private key(s):
        ssh_private_key: - name of private key(s)


