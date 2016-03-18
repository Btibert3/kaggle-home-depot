

// look at the attributes dataset
LOAD CSV WITH HEADERS FROM 'file:///Users/brock/github/kaggle-home-depot/data/attributes.csv' as row
WITH row
LIMIT 1
RETURN row

// look at the product descriptions dataset
LOAD CSV WITH HEADERS FROM 'file:///Users/brock/github/kaggle-home-depot/data/product_descriptions.csv' as row
WITH row
LIMIT 1
RETURN row

// look at the training dataset
LOAD CSV WITH HEADERS FROM 'file:///Users/brock/github/kaggle-home-depot/data/train.csv' as row
WITH row
LIMIT 1
RETURN row

// unwind the attributes to split out terms
LOAD CSV WITH HEADERS FROM 'file:///Users/brock/github/kaggle-home-depot/data/attributes.csv' as row
WITH row
LIMIT 1
WITH row, split(lower(row.value), " ") as value
UNWIND value as term
RETURN row.product_uid as uid, term

// unwind text and create relationships
LOAD CSV WITH HEADERS FROM 'file:///Users/brock/github/kaggle-home-depot/data/attributes.csv' as row
WITH row
LIMIT 1
WITH row, split(lower(row.value), " ") as value
UNWIND value as term
MERGE (product:Product {uid:toInt(row.product_uid)})
MERGE (t:Term {text:term})
MERGE (product)-[r:HAS_ATTS]->(t)
ON CREATE SET r.weight = 1
ON MATCH SET r.weight = r.weight + 1