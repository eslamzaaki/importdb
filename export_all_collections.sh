
#!/bin/bash

# Define MongoDB connection details
USERNAME="mongo_user"
PASSWORD="Za5PuP6zEIGEWSvi"
AUTH_DB="admin"
DATABASE="coachie-dev"

# Iterate over collections in the database
collections=$(mongo --username $USERNAME --password $PASSWORD --authenticationDatabase $AUTH_DB --quiet $DATABASE --eval "db.getCollectionNames()" | tr -d '\[\]\,')

for collection in $collections
do
    filename="new_$(echo $collection | sed 's/[^a-zA-Z0-9_]//g').json"
    # Export each collection to a JSON file
    mongoexport --username $USERNAME --password $PASSWORD --authenticationDatabase $AUTH_DB --db $DATABASE --collection $collection --out "$filename"
done

