FROM ansible/centos7-ansible:stable

# Add playbooks to the Docker image
ADD ansible /srv/ansible/
WORKDIR /srv/ansible

# Run Ansible to configure the Docker image
RUN ansible-playbook site.yml -c local
