#!/bin/bash

curl -H "Content-Type:application/json" -XGET 'elasticsearch:9200/movies/_search?pretty' -d'
{
  "query": {
    "prefix": {
      "title": {
        "value": "inter"
      }
    }
  }
}'