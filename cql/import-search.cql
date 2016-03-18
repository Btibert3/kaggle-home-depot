// import the search and relevance from the training
LOAD CSV WITH HEADERS FROM 'file:///Users/brock/github/kaggle-home-depot/data/train.csv' as row
WITH row
MATCH (p:Product {uid:toInt(row.product_uid)})
MERGE (s:Search {id:toInt(row.id)})
ON CREATE SET s.search_term = row.search_term
CREATE (r:Relevance {score:toFloat(row.relevance)})
CREATE (p)-[:INCLUDED_IN]->(s)
CREATE (s)-[:HAS_RELEVANCE]->(r);


// import the search and relevance from the testing
LOAD CSV WITH HEADERS FROM 'file:///Users/brock/github/kaggle-home-depot/data/test.csv' as row
WITH row
MATCH (p:Product {uid:toInt(row.product_uid)})
MERGE (s:Search {id:toInt(row.id)})
ON CREATE SET s.search_term = row.search_term
CREATE (p)-[:INCLUDED_IN]->(s);
