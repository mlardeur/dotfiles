#!/bin/bash
rpm-ostree install distrobox
systemctl restart

distrobox create fedora
distrobox enter fedora

