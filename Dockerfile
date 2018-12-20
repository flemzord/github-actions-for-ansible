FROM williamyeh/ansible:ubuntu18.04
MAINTAINER Maxence Maireaux

LABEL version="1.0.0"
LABEL repository="https://github.com/flemzord/github-actions-for-ansible"
LABEL homepage="https://github.com/flemzord/github-actions-for-ansible"
LABEL maintainer="Maxence Maireaux <maxence@maireaux.fr>"

LABEL com.github.actions.name="GitHub Action for Ansible"
LABEL com.github.actions.description="Wraps Ansible CLI to enable common commands."
LABEL com.github.actions.icon="terminal"
LABEL com.github.actions.color="purple"
COPY LICENSE README.md /

# Bring git back so we can install roles with Ansible Galaxy
RUN apt-get update -y && apt-get install -y git-core

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]