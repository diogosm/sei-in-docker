#!/bin/bash

set -e
set -x

echo "Trying to create cores..."

#start-local-solr
#/opt/solr/bin/solr start

#/opt/solr/bin/solr create -c sei-protocolos -d /dados/sei-protocolos/conf -p 8983 -V

echo "stopping solr..."
#stop-local-solr
#/opt/solr/bin/solr stop

exit 0
