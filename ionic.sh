#/bin/sh


if [ -f /etc/debian_version ]; then

	sudo apt-get install curl

	curl -sL https://deb.nodesource.com/setup | sudo bash -

	sudo apt-get install nodejs

	sudo apt-get install build-essential

	sudo npm install -g cordova ionic

elif [ -f /etc/redhat-release ]; then

	sudo yum install curl

	sudo yum install nodejs

	sudo yum install npm

	sudo npm install -g cordova ionic

fi
