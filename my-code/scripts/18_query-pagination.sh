#!/bin/bash

curl -H "Content-Type:application/json" -XGET 'elasticsearch:9200/movies/_search?size=2&from=2&pretty'

curl -H "Content-Type:application/json" -XGET elasticsearch:9200/movies/_search?pretty -d'
{
  "from": 1,
  "size": 2,
  "query": { "match": { "genre": "Sci-Fi" }}
}'