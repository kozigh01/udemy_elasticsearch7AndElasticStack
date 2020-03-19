#!/bin/bash

curl -H "Content-Type:application/json" -XGET 'elasticsearch:9200/movies/_search?pretty' -d'
{
  "query": {
    "fuzzy": {
      "title": {
        "value": "intrsteller",
        "fuzziness": 2
      }
    }
  }
}'

curl -H "Content-Type:application/json" -XGET 'elasticsearch:9200/movies/_search?pretty' -d'
{
  "query": {
    "fuzzy": {
      "title": {
        "value": "intrsteller",
        "fuzziness": "auto"
      }
    }
  }
}'