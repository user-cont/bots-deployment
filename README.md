# Ansible playbooks and scripts for deploying bots to Openshift

## tl;dr How to deploy

1. in [vars](vars/) copy [vars/template.yml](vars/template.yml) to `{deployment}.yml` where `{deployment}` is one of `prod`, `stage`, `dev`, `test`
2. in `vars/{deployment}.yml` fill in missing values
3. `DEPLOYMENT={deployment} make deploy`

## What's in here

- [playbooks](playbooks/) - Ansible playbooks.
- [vars](vars/) - Variable file(s). See section below for more info.
- [templates](templates/) - Openshift resource configuration files (templates).
- [run-deployment-in-container.sh](run-deployment-in-container.sh) - Run Ansible deploy playbook in a container.
- [run-cleanup-in-container.sh](run-cleanup-in-container.sh) - Run Ansible cleanup playbook in a container.

### Variable files

[vars/template.yml](vars/template.yml) is a variable file template.

You have to copy it to `prod.yml`, `stage.yml`, `dev.yml`, `test.yml`
depending on what environment you want to deploy to.

For example if you want to deploy to a cluster started on your machine with
`oc cluster up`, you just `cp template.yml dev.yml`
and in `dev.yml` you set `host: https://172.17.0.1:8443`.
Then you run `DEPLOYMENT=dev make deploy`.

If you want to deploy to 'staging environment', you `cp template.yml stage.yml`
and in `stage.yml` you set `host: your-staging-cluster-url`.
Then you run `DEPLOYMENT=stage make deploy`.

The ansible playbook then includes one of the variable files depending on the
value of DEPLOYMENT environment variable and processes all the templates with
variables defined in the file.

If you want to remove all objects from the deployment (project) run e.g.
`DEPLOYMENT=dev make cleanup`.
