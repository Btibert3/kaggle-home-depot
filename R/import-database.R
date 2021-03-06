options(stringsAsFactors = FALSE)

## libraries
library(RNeo4j)

## connect
graph = startGraph("http://localhost:7474/db/data/",
                   username = "neo4j",
                   password = "password")

## helper
NEO_SHELL = "~/neo4j-community-2.3.1/bin/neo4j-shell"
build_import = function(neo_shell, cypher_file) {
  cmd = sprintf("%s -file %s", neo_shell, cypher_file)
  system(cmd)
}

## clear the database
clear(graph, input=FALSE)

## import the constraints
build_import(NEO_SHELL, "../cql/import-constraints.cql")

## import the data
build_import(NEO_SHELL, "../cql/import-data.cql")
build_import(NEO_SHELL, "../cql/import-prod-title-terms.cql")
build_import(NEO_SHELL, "../cql/import-search.cql")
build_import(NEO_SHELL, "../cql/import-search-terms.cql")


