Containers BOSH Release
=======================

This BOSH release lets you run any number of containers, on a
per-VM basis.  This allows you to bring Dockerized workloads (with
OCI-compliant images) to BOSH, with the lifecycle you've come to
know and love.

For more information, read [Putting Docker Compose on top of
BOSH (or: I May Never Write Another BOSH Release Again)][1].

[1]: https://jameshunt.us/writings/docker-compose-on-bosh.html


## The Jumpbox Option

This release also contains a peculiar little job called `jumpbox`,
that allows you to colocate users with SSH keys, who will then be
placed inside of a container image of their choosing when they log
in.  See the following manifests for complete examples of a
variety of different scenarios:

 - [manifests/jumpbox.yml](manifests/jumpbox.yml) - A simple
   jumpbox with one user.  Great for personal use!

 - [manifest/jumpbox-shared.yml](manifests/jumpbox-shared.yml) - A
   jumpbox with several users that share a common group (staff).

 - [manifest/jumpbox-teams.yml](manifests/jumpbox-teams.yml) - A
   jumpbox with several people in a handful of different teams.
   People on the same team will be able to share files (or at
   least their group memberships allow it.)
