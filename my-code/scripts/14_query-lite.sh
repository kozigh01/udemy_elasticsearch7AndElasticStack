#!/bin/bash

curl -XGET elasticsearch:9200/movies/_search?q=title:star

# curl -XGET elasticsearch:9200/movies/_search?q=+year:>2010+title:trek
curl -XGET elasticsearch:9200/movies/_search?q=%2Byear%3A%3E2010+%2Btitle%3Atrek