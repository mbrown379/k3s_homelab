#!/bin/sh

message() {
  echo "######################################################################"
  echo "# $1"
  echo "######################################################################"
}

# 1. Authenticate to multipass
multipass authenticate

# 2. Remove existing VM
multipass delete --purge k3s

# 3. Create new VM
message "Launching k3s virtual machine..."
multipass launch --name k3s --memory 4G --disk 10G

# 4. Output VM details
multipass info k3s

# 5. Mount local repo
message "Mounting local git repository..."
multipass mount ~/workplace/home-cluster k3s:~/home-cluster

# 6. Open shell
message "VM creation complete!"
multipass shell k3s
