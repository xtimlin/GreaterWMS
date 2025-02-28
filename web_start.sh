#!/bin/bash
# web_start.sh
PORT=${PORT:-8080}  # Default to 8080 if PORT is not set
echo "Starting Quasar frontend on port $PORT"
quasar dev -p $PORT -H 0.0.0.0



##!/bin/bash
#cd /GreaterWMS/templates
#yarn install --force
#quasar build
#quasar d