FROM registry.fedoraproject.org/fedora:30

ENV HOME=/tmp/bots-deployment/
WORKDIR $HOME

RUN dnf install -y ansible git origin-clients python3-openshift

RUN mkdir -p $HOME/cloned

COPY . $HOME

CMD ansible-playbook --syntax-check playbooks/deploy.yml && ansible-playbook -vvv playbooks/deploy.yml
