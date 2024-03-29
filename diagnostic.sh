#!/usr/bin/env bash

mkdir diagnostics

cat <<EOT >> diagnostics/cluster_info
====Cluster Info====

$(kubectl cluster-info dump)

EOT

cat <<EOT >> diagnostics/resources

$(kubectl get all --all-namespaces -o wide)

EOT

cat <<EOT >> diagnostics/cluster_events
$(kubectl get events)

EOT

cat <<EOT >> diagnostics/aws-auth

$(kubectl get cm aws-auth -n kube-system -o yaml)

EOT

cat <<EOT >> diagnostics/aws-node-logs

====CNI Describe Output====

$(kubectl describe pod $(kubectl get pods -n kube-system -o=name | grep aws-node | sed "s/^.\{4\}//") -n kube-system) 

====CNI Pod Logs====

$(kubectl logs $(kubectl get pods -n kube-system -o=name | grep aws-node | sed "s/^.\{4\}//") -n kube-system) 

EOT

#zip file 
tar --create --verbose --gzip --file diagnostics_$(date --utc +%Y-%m-%d_%H%M-%Z).tar.gz --directory=diagnostics/ . > /dev/null 2>&1
