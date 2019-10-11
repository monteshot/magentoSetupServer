#!/bin/bash
DOCDIR="/home/monteshot/Documents"
VHOSTDIR="/home/monteshot/Documents/vhosts/"
NAMEOFPROJ="NAMEOFPROJ"
NAMEOFPROJ_USER_DB="monteshot"
NAMEOFPROJ_PASS_DB="monteshot"
if (( $# == 1 )) then
NAMEOFPROJ=$1
fi
if (( $# == 2 )) then
NAMEOFPROJ_USER_DB=$2
fi
if (( $# == 3 )) then
NAMEOFPROJ_PASS_DB=$3
fi
if (( $# == 4 )) then
DOCDIR=$4
fi
if (( $# == 5 )) then
VHOSTDIR=$5
fi

sudo chmod 755 createDbTable.sh
sudo chmod 755 createNginxSettings.sh
sudo ./createDbTable.sh $NAMEOFPROJ $NAMEOFPROJ_USER_DB $NAMEOFPROJ_PASS_DB
sudo ./createNginxSettings.sh $NAMEOFPROJ $DOCDIR $VHOSTDIR
