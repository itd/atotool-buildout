#!/bin/bash
PATHS=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=PATHS:$PATH

### Tarball and copy the production files to a local backup repo
### for quick recovery.

TD=`date +%Y%m%d%H%m`
cd /opt/sites/atotool/atotool-buildout/var
../bin/backup
sleep 1
tar -czf var-backup.tgz backups blobstoragebackups
sleep 30
echo -e "Copying var-backup.tgz to var-backup-$TD.tgz"
scp var-backup.tgz kbendl@stc-17111s.nrel.gov:/web/atotool/data/atotool-var-backup-$TD.tgz
