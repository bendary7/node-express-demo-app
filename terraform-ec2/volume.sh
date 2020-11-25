#!/bin/bash -xe

sudo mkdir -p  /data
sudo mkfs.ext4 ${instance_name}
sudo mount ${instance_name} /data
