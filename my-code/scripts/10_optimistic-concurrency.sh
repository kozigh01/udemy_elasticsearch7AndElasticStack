#!/bin/bash

echo 'get movie'
curl -XGET elasticsearch:9200/movies/_doc/109487?pretty

ehco 'add/update movie with specific seq no and term'
curl -H "Content-Type: application/json" -XPUT "elasticsearch:9200/movies/_doc/109487?if_seq_no=10&if_primary_term=3" -d'
{
  "genre": ["IMAX", "Sci-Fi"],
  "title": "interstellar",
  "year": 2014
}
'

ehco 'try it again - should error'
curl -H "Content-Type: application/json" -XPUT "elasticsearch:9200/movies/_doc/109487?if_seq_no=10&if_primary_term=3" -d'
{
  "genre": ["IMAX", "Sci-Fi"],
  "title": "interstellar",
  "year": 2014
}
'

ehco 'try it again, with retry option - should not error'
curl -H "Content-Type: application/json" -XPOST "elasticsearch:9200/movies/_doc/109487/_update?retry_on_conflict=5" -d'
{
  "doc": {
    "title": "interstellar2"
  }
}
'
