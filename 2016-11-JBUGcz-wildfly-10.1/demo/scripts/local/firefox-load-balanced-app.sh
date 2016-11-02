#!/bin/bash

set -x
MY_IP=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')

firefox http://$MY_IP:8080/counter-distributable/
