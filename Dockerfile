FROM williamyeh/ansible:ubuntu18.04
MAINTAINER Kitsu, Inc.

LABEL version="1.0.0"
LABEL repository="http://github.com/NuckChorris/ansible-actions"
LABEL homepage="http://github.com/NuckChorris/ansible-actions"
LABEL maintainer="Emma Lejeck <nuck@kitsu.io>"

LABEL com.github.actions.name="GitHub Action for Ansible"
LABEL com.github.actions.description="Wraps Ansible CLI to enable common commands."
LABEL com.github.actions.icon="terminal"
LABEL com.github.actions.color="purple"
COPY LICENSE README.md /

# Bring git back so we can install roles with Ansible Galaxy
RUN apt-get update -y && apt-get install -y git-core
