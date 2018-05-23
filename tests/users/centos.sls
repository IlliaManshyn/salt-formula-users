{% from "map.jinja" import user with context %}

users: 
 group.present:
    - name: {{ salt['pillar.get']('{{ user.name }}:group') }} 
    - gid: {{ salt['pillar.get']('{{ user.name }}:gid') }} 

 user.present:
  - password: {{ salt['pillar.get']('{{ user.name }}:password') }}
  - name: {{ salt['pillar.get']('{{ user.name }}:name') }}
  - home: /home/{{ salt['pillar.get']('{{ user.name }}:name') }}
  - enforce_password: true
  - uid: {{ salt['pillar.get']('{{ user.name }}:uid') }}
 
 ssh.auth.present:
  - user: {{ salt['pillar.get']('{{ user.name }}:uid') }}
  - source: {{ user.source }}
  - config: '%h/.ssh/authorized_keys'

{% if user.get('sudo', false) %}
/etc/sudoers.d/{{ salt['pillar.get']('{{ user.name }}:name') }}:
 file.managed:
  - source: salt://templates/sudoers.d.jinja2
  - templates: jinja
  - context:
      user_name: {{ salt['pillar.get']('{{ user.name }}:name') }}
{% endif -%}

