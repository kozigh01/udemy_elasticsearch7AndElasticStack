#!/bin/bash

curl -H "Content-Type:application/json" -XGET 'elasticsearch:9200/movies/_search?pretty' -d'
{
  "sort": [
    { "title.raw": { "order": "asc" } }
  ],
  "query": {
    "bool": {
      "must": { "match": { "genre": "Sci-Fi" }},
      "filter": { "range": { "year": { "lt": 1960 }}}
    }
  }
}'


curl -H "Content-Type:application/json" -XGET 'elasticsearch:9200/movies/_search?pretty' -d'
{
  "sort": [
    { "title.raw": { "order": "desc" } }
  ]
}'