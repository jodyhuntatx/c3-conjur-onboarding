#! /bin/bash

# Applied at /data by Conjur admin user
# Creates root policy branch for partner including:
# - Partner admin service account workload (policy owner)
# - Partner users group to grant humans and workloads read access to secrets
# - Pre-created safe consumers group w/ users group as member

source ../partner-vars.sh

cat >${PARTNER_NAME}-root.yml <<EOT
- !host
  id: ${PARTNER_NAME}_svc
  annotations:
    authn/api-key: true

# Partner policy branch
- !policy
  id: ${PARTNER_NAME}
  owner: !host ${PARTNER_NAME}_svc
  body:
    - !group ${PARTNER_USERS}
    - !group ${PARTNER_WORKLOADS}

# Pre-create safe consumers group and add user group to it
- !group vault/${PARTNER_SAFE}/delegation/consumers
- !grant
  role: !group vault/${PARTNER_SAFE}/delegation/consumers 
  members:
  - !group ${PARTNER_NAME}/${PARTNER_USERS}  
  - !group ${PARTNER_NAME}/${PARTNER_WORKLOADS}

EOT

./ccloud-cli.sh append /data ${PARTNER_NAME}-root.yml

rm ${PARTNER_NAME}-root.yml
