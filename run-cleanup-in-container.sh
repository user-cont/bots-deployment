#!/bin/bash -e

IMAGE_NAME="usercont/bots-deployment"

if [ -z "${DEPLOYMENT}" ]; then
    echo "DEPLOYMENT has to be defined (to one of prod/stage/dev/test)"
    exit 1
fi

if [ "${DEPLOYMENT}" == "prod" ]; then
    echo "Hey buddy, I can't let you wipe out production deployment, sorry :-("
    exit $EKILLEMALL
fi

docker run -ti \
           --rm \
           -e DEPLOYMENT=${DEPLOYMENT} \
           ${IMAGE_NAME} \
           /bin/bash -c "ansible-playbook --syntax-check playbooks/cleanup.yml && ansible-playbook -vvv playbooks/cleanup.yml"
