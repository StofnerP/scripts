#!/bin/bash
scp -i "~/Developer/server/nginx_key.pem" -r "ubuntu@18.191.45.92:/home/ubuntu/plex/*" "/data/"
ssh -i ~/Developer/server/nginx_key.pem ubuntu@ec2-18-191-45-92.us-east-2.compute.amazonaws.com 'rm -rf /home/ubuntu/plex/'
