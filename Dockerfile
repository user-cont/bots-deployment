FROM registry.fedoraproject.org/fedora:29

ENV HOME=/tmp/bots-deployment/
WORKDIR $HOME

RUN dnf install -y ansible git origin-clients

RUN pip3 install openshift

RUN mkdir -p $HOME/cloned

COPY . $HOME

CMD ansible-playbook --syntax-check playbooks/deploy.yml && ansible-playbook -vvv playbooks/deploy.yml
