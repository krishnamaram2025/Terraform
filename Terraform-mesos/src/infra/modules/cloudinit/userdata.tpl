#cloud-config
repo_update: true
repo_upgrade: all

write_files:
- path: /etc/csp/boot_config/metadata.json
  permissions: '0777'
  content: |
     {
     "meta": {
      "vm_role" : "${vm_role}"
     }
             }
             
- path: /home/centos/testing.sh
  permissions: '0777'
  owner: centos:centos
  content: |
     #!/bin/sh
     touch /home/centos/testing.txt

- path: /etc/csp/boot_scripts/ssh_keys.sh
  permissions: '0777'
  owner: centos:centos
  content: |
     #!/bin/sh
     ssh-keygen -q -t rsa -N '' -f /home/centos/.ssh/id_rsa <<<y 2>&1 >/dev/null

     cat /home/centos/.ssh/id_rsa.pub >> /home/centos/.ssh/authorized_keys

     ssh -o StrictHostKeyChecking=no centos@localhost
     
- path: /etc/csp/boot_scripts/play-books.sh
  permissions: '0777'
  owner: centos:centos
  content: |
     #!/bin/sh
     sudo systemctl start docker
     git clone https://github.com/cloudstones/docker-ansible.git

     cd docker-ansible/src/webapp

     ansible-playbook -i hosts plays/webapp.yml


runcmd:
 - touch /home/centos/touch.txt
 - [ sh, /home/centos/testing.sh ]
#- [ sh, /home/centos/ssh_keys.sh ]
# - [ sh, /home/centos/play_books.sh ]

