#!/bin/bash

dir=~
[ "$1" != "" ] && dir="$1"

cd $dir/ros2_ws
colconbuild
source $dir/.bashrc
timeout 10 ros2 launch mypkg talk_listen.launchpy > /tmp/mypkg.log

cat /tmp/mypkg.log |
	grep 'Listen: 10'
