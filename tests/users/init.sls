{% from "tests/users/map.jinja" import user with context %}

{{ salt['pillar.get']('user:name') }}: 
 group.present:
  - name: {{ salt['pillar.get']('group:name') }} 
  - gid: {{ salt['pillar.get']('group:gid') }} 

 user.present:
  - name: {{ salt['pillar.get']('user:name') }}
  - home: {{ salt['pillar.get']('user:home') }}
  - uid: {{ salt['pillar.get']('user:uid') }}
  - groups: {{ salt['pillar.get']('user:groups') }}

{{ salt['pillar.get']('user_to_del:name') }}:
  user.absent:
   - purge: true
 
{{ user.ssh_pkg }}:
  pkg.installed

ssh_public_keys: 
 ssh_auth.present:
  - user: {{ salt['pillar.get']('user:name') }}
  - source: {{ user.public_key_source }}
  - config: '/home/{{ salt['pillar.get']('user:name') }}/.ssh/authorized_keys'

{{ salt['pillar.get']('user:home') }}/.ssh/{{ salt['pillar.get']('user:name') }}.pem:
 file.managed:
  - source: 
     - {{ user.private_key_source}}

/etc/sudoers.d/{{ salt['pillar.get']('user:name') }}:
 file.managed:
  - source: salt://tests/users/templates/sudoers.d.jinja2
  - template: jinja
  - context:
      user_name: {{ salt['pillar.get']('user:name') }}

