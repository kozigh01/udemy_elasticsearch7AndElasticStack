#!/bin/bash

curl -H "Content-Type:application/json" -XGET 'elasticsearch:9200/movies/_search?sort=year&pretty'

# this throws error - can't sort on test field
curl -H "Content-Type:application/json" -XGET 'elasticsearch:9200/movies/_search?sort=title&pretty'


# Need to re-index to add "raw" title for sorting purposes

echo 'delete index'
curl -XDELETE elasticsearch:9200/movies

echo 'create index with new mapping'
curl -H "Content-Type: application/json" -XPUT elasticsearch:9200/movies -d'
{
  "mappings": {
    "properties": {
      "id": { "type": "integer" },
      "year": { "type": "date" },
      "genre": { "type": "keyword" },
      "title": { 
        "type": "text", 
        "analyzer": "english",
        "fields": {
          "raw": { "type": "keyword" }
        }
      }
    }
  }
}'

echo 'bulk load/index movies'
curl -H 'Content-Type: application/json' -XPUT elasticsearch:9200/_bulk?pretty --data-binary @movies.json

echo 'query movies'
curl -H 'Content-Type: application/json' -XGET elasticsearch:9200/movies/_search?pretty -d'
{
  "query": {
    "match": {
      "genre": "sci"
    }
  }
}'

echo 'now we can sort on title.raw'
curl -H "Content-Type:application/json" -XGET 'elasticsearch:9200/movies/_search?sort=title.raw&pretty'