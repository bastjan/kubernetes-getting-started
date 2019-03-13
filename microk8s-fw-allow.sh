#!/bin/bash

# Taken from https://github.com/ubuntu/microk8s#my-dns-and-dashboard-pods-are-crashlooping

# The Kubenet network plugin used by MicroK8s creates a cbr0 interface when the first pod is created. If you have ufw enabled, you'll need to allow traffic on this interface:
ufw allow in on cbr0
ufw allow out on cbr0

# Make sure packets to/from the pod network interface can be forwarded to/from the default interface on the host:
ufw default allow routed
iptables -P FORWARD ACCEPT
