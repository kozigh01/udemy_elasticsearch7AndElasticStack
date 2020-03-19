#!/bin/bash

curl -H "Content-Type:application/json" -XGET elasticsearch:9200/movies/_search?pretty -d'
{
  "query": {
    "match_phrase": { "title": "star wars" }
  }
}'

curl -H "Content-Type:application/json" -XGET elasticsearch:9200/movies/_search?pretty -d'
{
  "query": {
    "match_phrase": { 
      "title": {
        "query": "star beyond",
        "slop": 1
      } 
    }
  }
}'

# use high slop to get proximity query with results sorted by closer proximity
curl -H "Content-Type:application/json" -XGET elasticsearch:9200/movies/_search?pretty -d'
{
  "query": {
    "match_phrase": { 
      "title": {
        "query": "star beyond",
        "slop": 100
      } 
    }
  }
}'