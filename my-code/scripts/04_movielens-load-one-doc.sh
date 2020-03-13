#!/bin/bash

curl -H "Content-Type: application/json" -XPUT elasticsearch:9200/movies/_doc/109487 -d'
{
  "genre": ["IMAX","Sci-Fi"],
  "title": "Interstellar",
  "year": 2014
}'
