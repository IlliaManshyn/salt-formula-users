{% from "map.jinja" import user with context %}

{{ salt['pillar.get']('users:name') }}: 
 group.present:
  - name: {{ salt['pillar.get']('users:group') }} 
  - gid: {{ salt['pillar.get']('users:gid') }} 

 user.present:
  - name: {{ salt['pillar.get']('users:name') }}
  - home: /home/{{ salt['pillar.get']('users:name') }}
  - uid: {{ salt['pillar.get']('users:uid') }}

sshkeys: 
 ssh_auth.present:
  - user: {{ salt['pillar.get']('users:uid') }}
  - source: {{ user.source }}
  - config: '%h/.ssh/authorized_keys'

{% if user.get('sudo', false) %}
/etc/sudoers.d/{{ salt['pillar.get']('users:name') }}:
 file.managed:
  - source: salt://templates/sudoers.d.jinja2
  - templates: jinja
  - context:
      user_name: {{ salt['pillar.get']('users:name') }}
{% endif -%}

