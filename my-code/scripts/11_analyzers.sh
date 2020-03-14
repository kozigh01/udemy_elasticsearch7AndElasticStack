#!/bin/bash

curl -H "Content-Type: application/json" -XGET elasticsearch:9200/movies/_search?pretty -d'
{
  "query": {
    "match": {
      "title": "Star Trek"
    }
  }
}'

curl -H "Content-Type: application/json" -XGET elasticsearch:9200/movies/_search?pretty -d'
{
  "query": {
    "match_phrase": {
      "genre": "sci"
    }
  }
}'
