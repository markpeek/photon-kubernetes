#!/bin/bash
set -e
set -x

sudo tdnf install -y kubernetes

SERVICES="etcd kube-apiserver kube-controller-manager kube-scheduler kubelet"
for SERVICE in $SERVICES; do
    sudo systemctl restart $SERVICE
    sudo systemctl enable $SERVICE
    sudo systemctl status $SERVICE
done
