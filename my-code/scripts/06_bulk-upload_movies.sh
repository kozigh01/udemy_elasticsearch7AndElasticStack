#!/bin/bash

wget http://media.sundog-soft.com/es7/movies.json

curl -H 'Content-Type: application/json' -XPUT elasticsearch:9200/_bulk?pretty --data-binary @movies.json