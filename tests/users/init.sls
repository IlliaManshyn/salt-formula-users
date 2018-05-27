{% from "tests/users/map.jinja" import user with context %}

{{ salt['pillar.get']('user:user_to_del') }}:
  user.absent:
   - purge: true

{{ salt['pillar.get']('user:name') }}: 
 group.present:
  - name: {{ salt['pillar.get']('user:group_name') }} 
  - gid: {{ salt['pillar.get']('user:group_gid') }} 

 user.present:
  - name: {{ salt['pillar.get']('user:name') }}
  - home: {{ salt['pillar.get']('user:home') }}
  - uid: {{ salt['pillar.get']('user:uid') }}
  - gid: {{ salt['pillar.get']('user:gid') }}
  - groups: {{ salt['pillar.get']('user:groups') }}
 

 
{{ user.ssh_pkg }}:
  pkg.installed

ssh_public_keys: 
 ssh_auth.present:
  - user: {{ salt['pillar.get']('user:name') }}
  - source: {{ salt['pillar.get']('user:ssh_public_key') }}
  - config: '{{ salt['pillar.get']('user:home') }}/.ssh/authorized_keys'

{{ salt['pillar.get']('user:home') }}/.ssh/{{ salt['pillar.get']('user:name') }}.pem:
 file.managed:
  - source: {{ salt['pillar.get']('user:ssh_private_key') }}

/etc/sudoers.d/{{ salt['pillar.get']('user:name') }}:
 file.managed:
  - source: salt://tests/users/templates/sudoers.d.jinja2
  - template: jinja
  - context:
      user_name: {{ salt['pillar.get']('user:name') }}

