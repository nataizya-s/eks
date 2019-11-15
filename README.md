# EKS Diagnostics Tool

This tool collects info on the Kubernetes cluster to assist in troubleshooting common issues that arise when connecting a node to a cluster. This is specifically designed for EKS clusters.

## Usage
Run the diagnostics.sh script on your client machine (where kubectl commands are run from):
   
        $ ./diagnostics.sh
        
## Output
The script will then generate the "diagnostics" directory containing the following files:

        - aws-auth       --> the aws-auth config map
        - cluster_events --> any cluster events
        - resources      --> all the resources in the cluster (e.g. deployments, services, pods, etc)
        - cluster_info   --> contains the cluster info from the cluster-info dump command
        
