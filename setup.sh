#!/bin/bash
rpm-ostree install distrobox
systemctl restart

distrobox create dev
distrobox enter dev

