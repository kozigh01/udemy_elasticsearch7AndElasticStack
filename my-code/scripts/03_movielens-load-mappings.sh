#!/bin/bash

# curl -H "Content-Type: application/json" -XPUT 'elasticsearch:9200/movies' --data-binary "@movielens-mapping.json"
curl -H "Content-Type: application/json" -XPUT elasticsearch:9200/movies -d'
{
  "mappings": {
    "properties": {
      "year": {
        "type": "date"
      }
    }
  }
}'

curl -H 'Content-Type: application/json' -XGET elasticsearch:9200/movies/_mapping