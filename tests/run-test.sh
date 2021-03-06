#!/usr/bin/env bash

#ansible-playbook --verbose --inventory-file inventory --user vagrant --ask-pass --become-user root --ask-become-pass test.yml

rm -rf /tmp/roles
mkdir /tmp/roles
cp -R ~/GitHub/ansible-role-base /tmp/roles/kurron.base
cp -R ~/GitHub/ansible-role-jdk /tmp/roles/kurron.jdk
cp -R ~/GitHub/ansible-role-cpp-developer /tmp/roles/kurron.cpp-developer

packer validate packer.json
packer build --force packer.json


# Need to give the container access to your windowing system
export DISPLAY=:0
xhost +

CMD="docker run --env DISPLAY=unix${DISPLAY} \
                --env HOME=${HOME_DIR} \
                --env CL_JDK=/usr/lib/jvm/azul-jdk-8 \
                --env JDK_HOME=/usr/lib/jvm/azul-jdk-8 \
                --env JAVA_HOME=/usr/lib/jvm/azul-jdk-8 \
                --net host \
                --interactive \
                --tty \
                --rm \
                --volume /tmp/.X11-unix:/tmp/.X11-unix \
                --workdir /root/Software \
                kurron/ansible-role-cpp-developer:latest bash"
echo $CMD
$CMD
