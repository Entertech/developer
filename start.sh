#/bin/sh

cd /docs/Documents
sh ../update.sh $1 &
cd /docs/Documents/source
npm run serve -- --host 0.0.0.0
