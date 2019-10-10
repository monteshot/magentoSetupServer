#!/bin/bash
VHOSTDIR=$3
HOMEDIR=$2
if [[ ! -d $VHOSTDIR ]]; then
mkdir "$VHOSTDIR"
sudo ./genSite.sh $1 $HOMEDIR > "$VHOSTDIR"$1
sudo ln -s $VHOSTDIR$1 /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/
sudo nginx -t
sudo service nginx restart
  # Control will enter here if $DIRECTORY doesn't exist.
fi
if [[ -d $VHOSTDIR ]]; then
echo "$VHOSTDIR dir exist. Skipping"
  # Control will enter here if $DIRECTORY exists.
sudo ./genSite.sh $1 $HOMEDIR > "$VHOSTDIR"$1
sudo ln -s $VHOSTDIR$1 /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/
sudo nginx -t
sudo service nginx restart
fi
