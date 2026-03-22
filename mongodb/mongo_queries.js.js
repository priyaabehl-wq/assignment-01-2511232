// OP1: insertMany() — insert all 3 documents from sample_documents.json
db.products.insertMany([
{
  product_id: "E1001",
  name: "Samsung 55 inch Smart TV",
  category: "Electronics",
  brand: "Samsung",
  price: 52000,
  specifications: {
    screen_size: "55 inch",
    resolution: "4K UHD",
    voltage: "220-240V",
    smart_tv: true
  },
  warranty_years: 2
},

{
  product_id: "C2001",
  name: "Men's Cotton T-Shirt",
  category: "Clothing",
  brand: "Nike",
  price: 1200,
  sizes_available: ["S","M","L","XL"],
  material: "100% Cotton"
},

{
  product_id: "G3001",
  name: "Organic Almond Milk",
  category: "Groceries",
  brand: "Alpro",
  price: 350,
  expiry_date: new Date("2024-12-15"),
  nutrition: {
    calories: 60,
    protein_g: 1.5
  }
}
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find(
  { category: "Electronics", price: { $gt: 20000 } }
);


// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find(
  { category: "Groceries", expiry_date: { $lt: new Date("2025-01-01") } }
);


// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
  { product_id: "E1001" },
  { $set: { discount_percent: 10 } }
);


// OP5: createIndex() — create an index on category field
db.products.createIndex({ category: 1 });