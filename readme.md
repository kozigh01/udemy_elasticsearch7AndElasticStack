# Elasticsearch 7 and the Elastic Stack - In Depth & Hands On!

Course: [udemy](https://www.udemy.com/course/elasticsearch-7-and-elastic-stack/)

## Resources
* Docker: [image](https://hub.docker.com/_/elasticsearch)
  ```cmd
  # create network
  $ docker network create somenetwork

  # run elastic search
  $ docker run -d --name elasticsearch --net somenetwork -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:7.6.0
  ```
*

## Commands
* check if elastic search is running:
  ```bash
  $ curl -XGET 127.0.0.1:9200

* Get Shakspeare info:
  ```bash
  $ apt update && apt upgrade
  $ apt install wget
  $ wget https://media.sundog-soft.com/es7/shakes-mapping.json
  ```