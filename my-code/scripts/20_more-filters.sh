#!/bin/bash

curl -H "Content-Type:application/json" 'elasticsearch:9200/movies/_search?pretty' -d'
{
  "query": {
    "bool": {
      "must": { "match": { "genre": "Sci-Fi" }},
      "must_not": { "match": { "title": "trek" }},
      "filter": { "range": { "year": { "gte": 2010, "lt": 2015 }}}
    }
  }
}'