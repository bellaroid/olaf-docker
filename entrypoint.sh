#!/bin/bash
until mongo --host mongodb1 --eval "print(\"Waiting for connection...\")"
do
    sleep 2
done
echo "Connection Ready"
echo "Initializing Replica Set"
mongo --host mongodb1 <<EOF
rs.initiate(
  {
    _id : 'rs0',
    members: [
      { _id : 0, host : "mongodb1:27017" },
      { _id : 1, host : "mongodb2:27017" }
    ]
  }
)
EOF
echo "Replica Set Created"
mongod --replSet rs0 --port 27017 --bind_ip mongodb1 --dbpath /srv/mongodb/rs0  --oplogSize 128
python3 /opt/olaf/olaf-bin.py