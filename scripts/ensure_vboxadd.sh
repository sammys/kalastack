#!/bin/bash

# vagrant-vbguest 0.10.1 requirement
if [ ! -f /sbin/vboxadd ]
then
  vboxadd=$(find /opt -name vboxadd | head -n 1)
  if [ ! -f "$vboxadd" ] && [ -f /sbin/rcvboxadd ]
  then
    vboxadd=/sbin/rcvboxadd
  fi
  if [ -f "$vboxadd" ]
  then
    ln -s $vboxadd /sbin/vboxadd
    if [ ! -f /etc/init.d/vboxadd ]
    then
      ln -s "$vboxadd" /etc/init.d/vboxadd
    fi
  fi
fi
