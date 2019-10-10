#!/bin/bash
DOCDIR="/home/monteshot/Documents"
VHOSTDIR="/home/monteshot/Documents/vhosts/"
NAMEOFPROJ="NAMEOFPROJ"
sudo chmod 755 createDbTable.sh
sudo chmod 755 createNginxSettings.sh
sudo ./createDbTable.sh $NAMEOFPROJ NAMEOFPROJ_USER NAMEOFPROJ_PASS
sudo ./createNginxSettings.sh $NAMEOFPROJ $DOCDIR $VHOSTDIR
./setupMagento.sh