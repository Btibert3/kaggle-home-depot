// Search Terms from training
LOAD CSV WITH HEADERS FROM 'file:///Users/brock/github/kaggle-home-depot/data/train.csv' as row
WITH row, split(lower(row.search_term), " ") as value
UNWIND value as term
MATCH (s:Search {id:toInt(row.id)})
MERGE (t:Term {text:term})
MERGE (s)-[r:HAS_TERM]->(t)
ON CREATE SET r.weight = 1
ON MATCH SET r.weight = r.weight + 1;


// Search Terms from test
LOAD CSV WITH HEADERS FROM 'file:///Users/brock/github/kaggle-home-depot/data/test.csv' as row
WITH row, split(lower(row.search_term), " ") as value
UNWIND value as term
MATCH (s:Search {id:toInt(row.id)})
MERGE (t:Term {text:term})
MERGE (s)-[r:HAS_TERM]->(t)
ON CREATE SET r.weight = 1
ON MATCH SET r.weight = r.weight + 1;
