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
in.  See [manifests/jumpbox.yml](manifests/jumpbox.yml) for a
complete example.
