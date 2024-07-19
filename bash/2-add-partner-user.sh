#! /bin/bash

# Applied at /data/${PARTNER_NAME}
# Role grant for Identity users to give UI access to secrets.

source ../partner-vars.sh

cat >${PARTNER_NAME}-user.yml <<EOT
- !grant
  role: !group ${PARTNER_USERS}
  member: !user /${PARTNER_USERNAME}
EOT

./ccloud-cli.sh append /data/${PARTNER_NAME} ${PARTNER_NAME}-user.yml

rm ${PARTNER_NAME}-user.yml
