CREATE (:User{name:"Tamara"})
CREATE (:User{name:"Laetitia"})

CREATE (m:User{name:"Milos"})
CREATE (d:User{name:"Dejan"})
CREATE (m)-[:FOLLOWS]->(d)

CREATE (r:User{name:"Robert"})-[:FOLLOWS]->(a:User{name:"Alex"})

CREATE (:User{name:"Dragana", city: "Belgrade", nickname: "Gaga"})

CREATE (c1:Category{name:"Shoes"})
CREATE (c2:Category{name:"Cars"})
CREATE (c3:Category{name:"Bikes"})
CREATE (c4:Category{name:"Vehicles"})
CREATE (c2)-[:SUBCATEGORY]->(c4)
CREATE (c3)-[:SUBCATEGORY]->(c4);

MATCH (c:Category{name:"Shoes"})
MATCH (t:User{name:"Tamara"})
MATCH (l:User{name:"Laetitia"})
CREATE (t)-[:FOLLOWS]->(c)
CREATE (l)-[:FOLLOWS]->(c);

MATCH (c1:Category{name:"Vehicles"})
MATCH (c2:Category{name:"Cars"})
MATCH (m:User{name:"Milos"})
MATCH (r:User{name:"Robert"})
CREATE (m)-[:FOLLOWS]->(c1)
CREATE (r)-[:FOLLOWS]->(c2);

CREATE (p1:Product{id: 1, title: "very fast car", model: "Panamera", brand: "Porsche", price: 200000, quantity: 1})
CREATE (p2:Product{id: 2, title: "mountain bike", condition: "used", price: 850, quantity: 7})
CREATE (p3:Product{id: 3, title: "fancy Gucci shoes", brand: "Gucci", price: 900, color: "red", quantity: 12});

MATCH (c1:Category{name:"Cars"}), (c2:Category{name:"Bikes"}), (c3:Category{name:"Shoes"}),
  (r:User{name:"Robert"}), (a:User{name:"Alex"}), (m:User{name:"Milos"}), (d:User{name:"Dejan"}), (g:User{name:"Dragana"}), (t:User{name:"Tamara"}), (l:User{name:"Laetitia"}),
  (p1:Product{id: 1}), (p2:Product{id: 2}), (p3:Product{id: 3})
CREATE (p1)-[:BELONGS]->(c1)
CREATE (p2)-[:BELONGS]->(c2)
CREATE (p3)-[:BELONGS]->(c3)
CREATE (a)-[:SELLS]->(p1)
CREATE (d)-[:SELLS]->(p2)
CREATE (g)-[:SELLS]->(p3)
CREATE (l)-[:WATCHES]->(p2)
CREATE (l)-[:WATCHES]->(p3)
CREATE (t)-[:PURCHASED]->(p3);

MATCH (g:User{name:"Dragana"})
MATCH (t:User{name:"Tamara"})
CREATE (g)-[:ENDORSED{rate:5, comment:"everything was correct and on time"}]->(t)
CREATE (t)-[:ENDORSED{rate:5, comment:"awesome seller"}]->(g);

MATCH (c1:Category{name:"Cars"}), (c2:Category{name:"Bikes"}), (c3:Category{name:"Shoes"}),
      (t:User{name:"Tamara"}), (a:User{name:"Alex"}), (m:User{name:"Milos"}), (d:User{name:"Dejan"}), (g:User{name:"Dragana"}), (r:User{name:"Robert"})
CREATE (t)-[:FOLLOWS]->(d)
CREATE (t)-[:FOLLOWS]->(g)
CREATE (t)-[:FOLLOWS]->(a)
CREATE (d)-[:FOLLOWS]->(a)
CREATE (d)-[:FOLLOWS]->(r)
CREATE (c5:Category{name:'Phones'})
CREATE (m)-[:SELLS]->(:Product{id: 4, title: "Android mobile phone", model: "s10", brand: "Samsung", price: 730, quantity: 7, condition: 'new'})-[:BELONGS]->(c5)
CREATE (m)-[:SELLS]->(:Product{id: 5, title: "iOS mobile phone", model: "X", brand: "iphone", price: 560, quantity: 1, condition: 'used'})-[:BELONGS]->(c5)
CREATE (a)-[:SELLS]->(:Product{id: 6, title: "BMW X5 Black 2018", model: "X6", brand: "BMW", price: 30000, quantity: 1})-[:BELONGS]->(c1)
CREATE (a)-[:SELLS]->(:Product{id: 7, title: "BMW X6 White 2020", model: "X6", brand: "BMW", price: 75000, quantity: 1})-[:BELONGS]->(c1)
CREATE (a)-[:SELLS]->(:Product{id: 8, title: "BMW X1 Gray 2010", model: "X1", brand: "BMW", price: 8000, quantity: 1})-[:BELONGS]->(c1)
CREATE (a)-[:SELLS]->(:Product{id: 9, title: "Audi A4 White 2017", model: "A4", brand: "Ausi", price: 29000, quantity: 1})-[:BELONGS]->(c1)
CREATE (a)-[:SELLS]->(:Product{id: 10, title: "Mazda 6 Red 2020", model: "6", brand: "Mazda", price: 37000, quantity: 1})-[:BELONGS]->(c1)
CREATE (g)-[:SELLS]->(:Product{id: 11, title: "Gucci sandals", brand: "Gucci", price: 320, quantity: 3})-[:BELONGS]->(c3)
CREATE (g)-[:SELLS]->(:Product{id: 12, title: "Gucci boots", brand: "Gucci", price: 400, quantity: 7})-[:BELONGS]->(c3)
CREATE (g)-[:SELLS]->(:Product{id: 13, title: "Gucci sneakers", brand: "Gucci", price: 350, quantity: 2})-[:BELONGS]->(c3)
CREATE (g)-[:SELLS]->(:Product{id: 14, title: "Addidas sneakers", brand: "Addidas", price: 100, quantity: 1})-[:BELONGS]->(c3)
CREATE (g)-[:SELLS]->(:Product{id: 15, title: "Nike sneakers", brand: "Nike", price: 100, quantity: 1})-[:BELONGS]->(c3)
CREATE (d)-[:SELLS]->(:Product{id: 16, title: "Road bike", quantity: 1, price: 50, condition: 'used'})-[:BELONGS]->(c2)
CREATE (d)-[:SELLS]->(:Product{id: 17, title: "Bike for kids", quantity: 1, price: 50, condition: 'used'})-[:BELONGS]->(c2);