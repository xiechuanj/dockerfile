#!/bin/bash
pids=$(pidof /usr/bin/Xvfb)
if[ -n $pids ]; then
  kill $pids
fi
