curl -XGET elasticsearch:9200/movies/_search?q=Interstellar

curl -XDELETE elasticsearch:9200/movies/_doc/109487?pretty

curl -H 'Content-Type: application/json' -XGET elasticsearch:9200/movies/_doc/109487?pretty
