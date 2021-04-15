#!/bin/bash
if [ "$#" -eq 2 ]; then
	case "$1" in
		"movie")
			path="Movies"
			;;
		"tvshow")
			path="TV Shows"
			;;
		"film")
			path="Filme"
			;;
		"serie")
			path="Serien"
			;;
		*)
			echo "wrong arguments... first must be [movie|tvshow|film|serie] and second the file"
			exit 1
			;;
	esac
	ssh -i ~/Developer/server/nginx_key.pem ubuntu@ec2-18-191-45-92.us-east-2.compute.amazonaws.com "mkdir -p /home/ubuntu/plex/$path"	
	scp -i "~/Developer/server/nginx_key.pem" -r "$2" "ubuntu@18.191.45.92:/home/ubuntu/plex/$path"
else 
	echo 'wrong arguments... first must be [movie|tvshow|film|serie] ans second the file'
fi
