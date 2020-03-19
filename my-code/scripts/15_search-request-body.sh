#!/bin/bash

curl -H "Content-Type:application/json" -XGET elasticsearch:9200/movies/_search?pretty -d'
{
  "query": {
    "match": { "title": "star" }
  }
}'

curl -H "Content-Type:application/json" -XGET elasticsearch:9200/movies/_search?pretty -d'
{
  "query": {
    "bool": {
      "must": { "term": { "title": "trek" } },
      "filter": { "range": { "year": { "gte": 2010 } } }
    }
  }
}'