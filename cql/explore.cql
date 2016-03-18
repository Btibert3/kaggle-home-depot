// node types and volume
MATCH (n)
RETURN LABELS(n) as type, COUNT(*) as tot


// look at a product and its search graph
