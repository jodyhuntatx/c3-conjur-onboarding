# for setting up root policy
# Provisioned by 1-create-partner-branch.sh
export PARTNER_NAME="JodyTest"
export PARTNER_USERS=$PARTNER_NAME-users
export PARTNER_WORKLOADS={{PARTNER_NAME}}-workloads
export PARTNER_SAFE=Partner-$PARTNER_NAME

# Identity user - for UI access
# Provisioned by 2-add-partner-user.sh
export PARTNER_USERNAME=testjody@c3.partners

# Workload - for programmatic access
# Provisioned by 3-add-partner-workload.sh
export PARTNER_WORKLOAD=$PARTNER_NAME-workload
