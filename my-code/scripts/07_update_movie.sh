#!/bin/bash

curl -H 'Content-Type: application/json' -XPOST elasticsearch:9200/movies/_doc/109487/_update -d'
{
  "doc": {
    "title": "Interstellar2"
  }
}
'

curl -H 'Content-Type: application/json' -XGET elasticsearch:9200/movies/_doc/109487?pretty

