To start working with this formula you should add to /etc/salt/master following lines:

To add root dir:
file_roots:
  base:
     - /home/user_name/salt-formula-users

To add pillar root-dir: 
pillar_roots:
 base:
  - /home/user_name/salt-formula-users/tests/pillar
 users:
  - /home/user_name/salt-formula-users/tests

To start formula use following command command:
salt "*" state.sls tests.users.init

In pillars you can: 
Set user data by changing args in ID: user
	name: - to set username 
	home: - to set user home dir
	uid: - to set user id
	gid: - to set group id for user
	groups: - to add user in groups

Set group data by changing args in ID: group
	name: - to set group name
	gid: - to set group id

Delete any user by changing args in ID: user_to_del
	name: - to set username

Set path to ssh public key by changing args in ID: ssh_public_keys
	source: - path to public key from salt root dir

Set path to ssh private key by changing args in ID: ssh_public_keys
        source: - path to private key from salt root dir

