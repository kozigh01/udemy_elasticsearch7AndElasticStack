# Elasticsearch 7 and the Elastic Stack - In Depth & Hands On!

Course: [udemy](https://www.udemy.com/course/elasticsearch-7-and-elastic-stack/) | [course materials](https://sundog-education.com/elasticsearch)

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

* start/use docker containers
  ```bash
  $ docker-compose up
  $ winpty docker container exec -it my-code_ubuntu_1 bash
  bash# curl -XGET elasticsearch:9200
  ```

* create shakespeare index
  ```bash
  $ curl -H "Content-Type: application/json" -XPUT elasticsearch:9200/shakespeare --data-binary @shakes-mapping.js
  ```
* get Shakespeare content and load into elastic search
  ```bash
  $  wget http://media.sundog-soft.com/es7/shakespeare_7.0.json
  $ curl -H "Content-Type: application/json" -XPOST 'elasticsearch:9200/shakespeare/_bulk' --data-binary @shakespeare_7.0.json
  ```
* query for a quote
  ```bash
  $  curl -H "Content-Type: application/json" -XGET 'elasticsearch:9200/shakespeare/_search?pretty' -d '{ "query": { "match_phrase": { "text_entry": "to be or not to be" }}}'
  ```