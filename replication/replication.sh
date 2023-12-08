#!/bin/bash -ex

SWD=$( cd $(dirname $0); pwd )

main=dns-main.$DPSRV_DOMAIN
node=${DPSRV_REGION}-${DPSRV_NODE}.$DPSRV_DOMAIN


while [ 1 ]; do
	host $main | grep -v NXDOMAIN | sort > /tmp/replication.host 2>/dev/null

	diff -q /tmp/replication.host /tmp/replication.last-host 2>/dev/null && continue

	if grep -q $node /tmp/replication.host; then
		$SWD/main.sh && complete=true
	else
		$SWD/replica.sh && complete=true
	fi

	if [ "$complete" = "true" ]; then
		cp /tmp/replication.host /tmp/replication.last-host
	fi

	TTL=$( dig +nocmd +noall +answer +ttlid -t cname $main | awk '{ print $2 }' )
	sleep $TTL
done

