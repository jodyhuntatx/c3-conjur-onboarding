#!/bin/bash

echo
echo
echo "This script calls a Flow to onboard a Partner and Partner user"
echo "  to Conjur Cloud."
echo
echo

export FLOWS_TENANT=aax4917.flows.cyberark.cloud
export FLOW_NAME=BizDevTech-ProcessConjurCloud-Jody
export OAUTH2_USER=restapiuser@c3.demo

read -sp "Enter $OAUTH2_USER password:" OAUTH2_PWD
echo
read -p "Enter partner name: " PARTNER_NAME
read -p "Enter partner username: " PARTNER_USERNAME

echo
echo "Running Flow with these variables:"
echo " OAUTH2_USER: $OAUTH2_USER"
echo " OAUTH2_PWD: $OAUTH2_PWD"
echo " PARTNER_NAME: $PARTNER_NAME"
echo " PARTNER_USERNAME: $PARTNER_USERNAME"
echo

set -x
curl -kv -X POST						\
	-H 'Content-Type: application/json' 			\
	--data "{						\
		\"oauth2User\": \"$OAUTH2_USER\",		\
		\"oauth2Pwd\": \"$OAUTH2_PWD\",			\
		\"partnerName\": \"$PARTNER_NAME\",		\
		\"partnerUsername\": \"$PARTNER_USERNAME\"	\
	}"							\
	"https://$FLOWS_TENANT/api/v2/$FLOW_NAME/play"
echo
echo
