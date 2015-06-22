# built with: 'docker build --rm=true -t ipv1337/docker-ansible-gcloud .'
FROM ansible/centos7-ansible:stable

# Add playbooks to the Docker image
ADD ansible /srv/ansible/
WORKDIR /srv/ansible

# Run Ansible to configure the Docker image
RUN ansible-playbook site.yml -c local

# Switch to gcloud user
USER gcloud

# Volumes
VOLUME ['/data']
VOLUME ['/home/ansible/ansible']
VOLUME ['/home/gcloud/.config/gcloud']

CMD /bin/bash

# example use: 'docker run --name myworkspace -it ipv1337/docker-ansible-gcloud'
