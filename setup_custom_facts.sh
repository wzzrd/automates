---
- name: finish configuration of hosts
  hosts: all
  become: yes
  remote_user: ec2-user
  gather_facts: no

  tasks:
    - name: create custom fact directory
      file:
        path: /etc/ansible/facts.d
        state: directory
        owner: root
        group: root
        mode: 0755

    - name: set up custom facts
      template:
        src: facts.sh
        dest: /etc/ansible/facts.d/facts.sh
        mode: 0755

    - name: reload ansible_local
      setup: filter=ansible_local