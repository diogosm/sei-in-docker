#!/bin/bash

sudo docker build -t sei .
sudo docker --name sei run -p 80:80 -d sei
