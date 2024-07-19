#! /bin/bash

# Applied at /data/${PARTNER_NAME}
# Creates workloads of form: /data/partner-name/workload-name

source ../partner-vars.sh

cat  >${PARTNER_NAME}-workload.yml <<EOT
# create workload identity
- !host
  id: ${PARTNER_WORKLOAD}
  annotations:
    authn/api-key: true

# grant workload the role for secrets access
- !grant
  role: !group ${PARTNER_WORKLOADS}
  member: !host ${PARTNER_WORKLOAD}

# permit users to see the workload
- !permit
  role: !group ${PARTNER_USERS}
  privileges: [ read, execute, update ]
  resource: !host ${PARTNER_WORKLOAD}  
EOT

./ccloud-cli.sh append /data/${PARTNER_NAME} ${PARTNER_NAME}-workload.yml

rm ${PARTNER_NAME}-workload.yml
