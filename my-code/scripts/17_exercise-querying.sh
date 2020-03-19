#!/bin/bash

curl -H "Content-Type:appication/json" -XGET "elasticsearch:9200/movies/_search?q=%2Btitle:star%20wars%2Byear:%3E1980&pretty"

curl -H "Content-Type:application/json" -XGET "elasticsearch:9200/movies/_search?pretty" -d'
{
  "query": {
    "bool": {
      "must": { "match_phrase": { "title": "star wars" } },
      "filter": { "range": { "year": { "gt": 1980 }}}
    }
  }
}'