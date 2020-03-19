#!/bin/bash

curl -XGET "elasticsearch:9200/movies/_search?q=title:star&pretty"

curl -XGET "elasticsearch:9200/movies/_search?q=+year:>2010+title:trek&pretty"
# same query, but url encoded
curl -XGET "elasticsearch:9200/movies/_search?q=%2Byear%3A%3E2010+%2Btitle%3Atrek&pretty"