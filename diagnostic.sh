#!/bin/bash

mkdir diagnostics

cat <<EOT >> diagnostics/cluster_info
====Cluster Info====

$(kubectl cluster-info dump) >& /dev/null

EOT

cat <<EOT >> diagnostics/resources

$(kubectl get all --all-namespaces -o wide >& /dev/null) 

EOT

cat <<EOT >> diagnostics/cluster_events

$(kubectl get events >& /dev/null)

EOT


