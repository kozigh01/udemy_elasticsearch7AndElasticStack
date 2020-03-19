#!/bin/bash

curl -XDELETE elasticsearch:9200/movies

curl -H "Content-Type:application/json" -XPUT 'elasticsearch:9200/movies?pretty' -d'
{
  "settings": {
    "analysis": {
      "filter": {
        "autocomplete_filter": {
          "type": "edge_ngram",
          "min_gram": 1,
          "max_gram": 20
        }
      },
      "analyzer": {
        "autocomplete": {
          "type": "custom",
          "tokenizer": "standard",
          "filter": [
            "lowercase",
            "autocomplete_filter"
          ]
        }
      }
    }
  }
}'

curl -H "Content-Type:application/json" -XPUT 'elasticsearch:9200/movies/_mapping?pretty' -d'{
  "properties": {
    "title": {
      "type": "text",
      "analyzer": "autocomplete"
    }
  }
}'

wget http://media.sundog-soft.com/es7/movies.json
curl -H 'Content-Type: application/json' -XPUT elasticsearch:9200/_bulk?pretty --data-binary @movies.json

curl -H 'Content-Type: application/json' -XGET 'elasticsearch:9200/movies/_search?pretty' -d'{
  "query": {
    "match": {
      "title": {
        "query": "sta",
        "analyzer": "standard"
      }
    }
  }
}'