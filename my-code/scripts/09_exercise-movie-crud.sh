echo 'Movie Exercise: CRUD'

echo 'Insert new movie'
curl -H 'Content-Type: application/json' -XPUT elasticsearch:9200/movies/_doc/test1234 -d'
{
  "genre": ["cool","scyfy","future"],
  "title": "My Awesome Time-travel Movie",
  "year": 1966
}
'

echo 'Display movie'
curl -XGET elasticsearch:9200/movies/_doc/test1234?pretty

echo 'Update movie'
curl -H 'Content-Type: application/json' -XPOST elasticsearch:9200/movies/_doc/test1234/_update -d'
{
  "doc": {
    "title": "New title"
  }
}
'

echo 'Display movie'
curl -XGET elasticsearch:9200/movies/_doc/test1234?pretty

echo 'Delete movie'
curl -XDELETE elasticsearch:9200/movies/_doc/test1234?pretty

echo 'Display movie'
curl -XGET elasticsearch:9200/movies/_doc/test1234?pretty
