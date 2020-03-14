#!/bin/bash

echo 'create new series index'
curl -H 'Content-Type:application/json' -XPUT elasticsearch:9200/series -d'
{
  "mappings": {
    "properties": {
      "film_to_franchise": {
        "type": "join",
        "relations": { "franchise": "film" }
      }
    }
  }
}'

echo 'download series data'
wget http://media.sundog-soft.com/es7/series.json

echo 'load series data'
curl -H 'Content-Type:application/json' -XPUT elasticsearch:9200/_bulk?pretty --data-binary @series.json

echo 'get all star wars films'
curl -H 'Content-Type:application/json' -XGET elasticsearch:9200/series/_search?pretty -d'
{
  "query": {
    "has_parent": {
      "parent_type": "franchise",
      "query": {
        "match": {
          "title": "Star Wars"
        }
      }
    }
  }
}'

curl -H 'Content-Type:application/json' -XGET elasticsearch:9200/series/_search?pretty -d'
{
  "query": {
    "has_child": {
      "type": "film",
      "query": {
        "match": {
          "title": "The Force Awakens"
        }
      }
    }
  }
}'