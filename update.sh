#/bin/sh

echo "Params: $1"

UPSTREAM=${1:-'@{u}'}
REMOTE_RECORD=$(git ls-remote | grep refs/heads/$1 | cut -f 1)

echo "REMOTE_RECORD: $REMOTE_RECORD"

while true
do
    REMOTE=$(git ls-remote | grep refs/heads/$1 | cut -f 1)
 
    echo "REMOTE: $REMOTE"

    if [ $REMOTE_RECORD = $REMOTE ]; then
        echo "Up-to-date"
    else
        echo "Need to pull"
        git pull
        REMOTE_RECORD=$(git ls-remote | grep refs/heads/$1 | cut -f 1)
        cd source
        yarn build
        cd ..
    fi
    sleep 60s
done