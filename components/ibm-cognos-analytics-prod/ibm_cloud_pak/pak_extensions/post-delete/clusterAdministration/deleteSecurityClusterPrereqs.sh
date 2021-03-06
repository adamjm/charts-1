#!/bin/bash
set -e
#
#################################################################
# Licensed Materials - Property of IBM
# (C) Copyright IBM Corp. 2018.  All Rights Reserved.
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with
# IBM Corp.
#################################################################
#
# You need to run this once per cluster
#
# Example:
#     ./deleteSecurityClusterPrereqs.sh
#

. ../../common/kubhelper.sh


if supports_scc; then
  echo "Removing the SCC..."
  #kubectl delete -f ../../pre-install/clusterAdministration/ibm-chart-dev-scc.yaml
fi

if supports_psp; then
    echo "Removing the PSP and ClusterRole..."
    kubectl delete -f ../../pre-install/clusterAdministration/ibm-cognos-analytics-prod-cr.yaml
    kubectl delete -f ../../pre-install/clusterAdministration/ibm-cognos-analytics-prod-psp.yaml
fi
