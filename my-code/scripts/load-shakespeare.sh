#!/bin/bash

curl -H "Content-Type: application/json" -XPOST 'elasticsearch:9200/shakespeare/_bulk' --data-binary @shakespeare_7.0.json
curl -H "Content-Type: application/json" -XGET 'elasticsearch:9200/shakespeare/_search?pretty' -d '{ "query": { "match_phrase": { "text_entry": "to be or not to be" }}}' > to-be-or-not-to-be.txt
tail -f /dev/null