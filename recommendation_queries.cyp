
// Watch list
MATCH (u:User{name:'Laetitia'})-[:WATCHES]->(p)
RETURN p;
MATCH (u:User{name:'Dejan'})-[:WATCHES]->(p)
RETURN p;

// Because you follow user X
MATCH (t:User{name:'Tamara'})
MATCH (t)-[:FOLLOWS]->(u:User)
MATCH (u)-[:SELLS|WATCHES]->(p)
RETURN u,p;

// Based on all categories you follow
MATCH (m:User{name:'Milos'})
MATCH (m)-[:FOLLOWS]->(c:Category)<-[:SUBCATEGORY*0..]-(sub)
MATCH (p:Product) WHERE (p)-[:BELONGS]->(c) OR (p)-[:BELONGS]->(sub)
RETURN p;

MATCH (m:User{name:'Robert'})
MATCH (m)-[:FOLLOWS]->(c:Category)<-[:SUBCATEGORY*0..]-(sub)
MATCH (p:Product) WHERE (p)-[:BELONGS]->(c) OR (p)-[:BELONGS]->(sub)
RETURN p;

// Similar to what you purchased (in the same category)
MATCH (t:User{name:'Tamara'})
MATCH (t)-[:PURCHASED]->(p:Product)
MATCH (p)-[:BELONGS]->(c:Category)
MATCH (similar:Product) WHERE similar.id <> p.id AND (similar)-[:BELONGS]->(c)
RETURN similar
ORDER BY apoc.text.distance(similar.title, p.title)
LIMIT 3;

// Similar to what you purchased (in the same category + parent category)
MATCH (t:User{name:'Tamara'})
MATCH (t)-[:PURCHASED]->(p:Product)
MATCH (p)-[:BELONGS]->(c:Category)-[:SUBCATEGORY*0..1]->(parent:Category)
MATCH (similar:Product) WHERE similar.id <> p.id AND ((similar)-[:BELONGS]->(c) OR (similar)-[:BELONGS]->(parent))
RETURN similar
ORDER BY apoc.text.distance(similar.title, p.title)
LIMIT 3;

// “You might be interested in this seller” recommendation
MATCH (u1:User{name:'Milos'})-[:FOLLOWS*2..2]->(u:User)-[:SELLS]->()
RETURN u
LIMIT 3
