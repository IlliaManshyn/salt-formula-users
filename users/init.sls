{% from "users/map.jinja" import user with context %}

{{ user.ssh_pkg }}:
  pkg.installed

{% for name, user in pillar.get('user', {}).items() %}
{% if 'user_to_del' in user %}
{{ user['user_to_del'] }}:
  user.absent:
   - purge: true
{% endif %}

{{ name }}: 
 group.present:
{% if 'group_name' in user %}
  - name: {{ user['group_name'] }} 
{% if 'group_gid' in user %}
  - gid: {{ user['group_gid'] }} 
{% endif %}
{% endif %}


 user.present:
  - name: {{ name  }}
{% if 'home' in user %}
  - home: {{ user['home'] }}
{% endif %}
{% if 'uid' in user %}
  - uid: {{ user['uid'] }}
{% endif  %}
{% if 'gid' in user %}
  - gid: {{ user['gid'] }}
{% endif %}
{% if 'groups' in user %}
  - groups: {{ user['groups'] }}
{% endif %}
{% if 'home' in user %}
{% if 'ssh_key_path' in user %}
{% if 'ssh_public_key' in user %}
{%  for public_key in user.get('ssh_public_key', [])  %}
{{public_key}}: 
 ssh_auth.present:
  - user: {{ name  }} 
  - source: {{ user['ssh_key_path']}}/{{ public_key }}
  - config: '{{ user['home'] }}/.ssh/authorized_keys'
{% endfor %}
{% endif %}

{% if 'ssh_private_key' in user %}
{% for private_key in user.get('ssh_private_key', []) %}
{{ user['home'] }}/.ssh/{{ private_key }}:
 file.managed:
  - source: {{ user['ssh_key_path'] }}/{{ private_key }}
{% endfor %}
{% endif %}
{% endif %}
{% endif %}

/etc/sudoers.d/{{ name }}:
 file.managed:
  - source: salt://users/templates/sudoers.d.jinja2
  - template: jinja
  - context:
      user_name: {{ name }}
{% endfor %}

