# Ricardo Tech Talk - Graph Databases

Graph databases, as the name suggests, are based on the mathematical principle of graph theory. Tech giants like Facebook, Google and LinkedIn use graph database technology to harness the power of data connections and leverage superior performance when querying related data. In the last few years, they have become quite popular option for data management, but on the other hand they still remain an enigma to many.

In this talk, we would like to share a story about this family of databases and the experience implementing one of them.

This repo contains the sample files and configuration that will be used during the talk. 

## Create and start an instance of Graph DB (Neo4J community edition)

Navigate to the project root and start the Docker container using Docker compose:

```
docker-compose up
```

If you want to use the console:

- Go to your browser
- open localhost:7687 
- log in using empty credentials

## Cypher scripts

There are 2 scripts in the root of the project:

1. `sample_db.cyp` - contains data for initializing the demo database
1. `recommendation_queries.cyp` - contains queries for a recommendation engine