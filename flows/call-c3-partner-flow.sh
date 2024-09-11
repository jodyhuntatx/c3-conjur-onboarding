#!/bin/bash

export FLOWS_TENANT=aax4917.flows.cyberark.cloud
export FLOW_NAME=Conjur-Onboarding

source ../partner-vars.sh

echo
echo "Running Flow with these variables:"
echo " PARTNER_NAME: $PARTNER_NAME"
echo " PARTNER_USERS: $PARTNER_USERS"
echo " PARTNER_WORKLOADS: $PARTNER_WORKLOADS"
echo " PARTNER_SAFE: $PARTNER_SAFE"
echo " PARTNER_USERNAME: $PARTNER_USERNAME"
echo " PARTNER_WORKLOAD: $PARTNER_WORKLOAD"
echo

set -x
curl -kv -X POST						\
	-H 'Content-Type: application/json' 			\
	--data "{						\
		\"partnerName\": \"$PARTNER_NAME\",		\
		\"partnerUsers\": \"$PARTNER_USERS\",		\
		\"partnerWorkloads\": \"$PARTNER_WORKLOADS\",	\
		\"partnerSafe\": \"$PARTNER_SAFE\",		\
		\"partnerUsername\": \"$PARTNER_USERNAME\",	\
		\"partnerWorkload\": \"$PARTNER_WORKLOAD\"	\
	}"							\
	https://$FLOWS_TENANT/api/v2/$FLOW_NAME/play
echo
echo
