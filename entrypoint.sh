#!/bin/sh
set -e
cd "${ANSIBLE_ACTION_WORKING_DIR:-.}"

if [  ! -z "$SSH_PRIVATE_KEY" ]; then
  echo "${SSH_PRIVATE_KEY}" > ~/.ssh/id_rsa
fi

if [ "$USE_GALAXY" = "true" ]; then
  ansible-galaxy install -r ${ANSIBLE_ACTION_GALAXY_FILE}
fi

ansible-playbook ${ANSIBLE_ACTION_FILE} ${ANSIBLE_ACTION_OPTS}
SUCCESS=$?

exit $SUCCESS