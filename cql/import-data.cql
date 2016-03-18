// import the product nodes and title from training
LOAD CSV WITH HEADERS FROM 'file:///Users/brock/github/kaggle-home-depot/data/train.csv' as row
WITH row
MERGE (p:Product {uid:toInt(row.product_uid)} )
ON CREATE SET p.title = row.product_title;


// import the product nodes and title from test
LOAD CSV WITH HEADERS FROM 'file:///Users/brock/github/kaggle-home-depot/data/test.csv' as row
WITH row
MERGE (p:Product {uid:toInt(row.product_uid)} )
ON CREATE SET p.title = row.product_title;

