// add the product title and the terms from training
LOAD CSV WITH HEADERS FROM 'file:///Users/brock/github/kaggle-home-depot/data/train.csv' as row
WITH row, split(lower(row.product_title), " ") as value
UNWIND value as term
MATCH (p:Product {uid:toInt(row.product_uid)} )
MERGE (t:Term {text:term})
MERGE (p)-[r:TITLE_HAS]->(t)
ON CREATE SET r.weight = 1
ON MATCH SET r.weight = r.weight + 1;

// add the product title and the terms from test
LOAD CSV WITH HEADERS FROM 'file:///Users/brock/github/kaggle-home-depot/data/test.csv' as row
WITH row, split(lower(row.product_title), " ") as value
UNWIND value as term
MATCH (p:Product {uid:toInt(row.product_uid)} )
MERGE (t:Term {text:term})
MERGE (p)-[r:TITLE_HAS]->(t)
ON CREATE SET r.weight = 1
ON MATCH SET r.weight = r.weight + 1;
