#!/bin/bash

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
      "title": { "type": "text", "analyzer": "english" }
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

curl -H 'Content-Type: application/json' -XGET elasticsearch:9200/movies/_search?pretty -d'
{
  "query": {
    "match": {
      "genre": "Sci-Fi"
    }
  }
}'

curl -H 'Content-Type: application/json' -XGET elasticsearch:9200/movies/_search?pretty -d'
{
  "query": {
    "match": {
      "title": "Star Wars"
    }
  }
}'