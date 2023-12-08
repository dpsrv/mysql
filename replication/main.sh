#!/bin/bash -ex

SWD=$( cd $(dirname $0); pwd )

main=dns-main.$DPSRV_DOMAIN
node=${DPSRV_REGION}-${DPSRV_NODE}.$DPSRV_DOMAIN

echo main

