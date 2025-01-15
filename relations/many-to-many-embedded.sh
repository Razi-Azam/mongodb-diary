# Many to Many Embedded

#create a customer collection
db.customers.insertOne({name: "Max", age: 29})

#create a product collection
db.products.insertOne({title: "A Book", price: 12.99})


#update the customer collection with product details
db.customers.updateOne({}, {$set: {orders: [{title: "A Book", price: 12.99, quantity: 2}] } })

#product collection
db.products.find()

#output
[
  {
    _id: ObjectId('6787e79a8d27284d300d8193'),
    title: 'A Book',
    price: 12.99
  }
]

#customer collection
 db.customers.findOne()

#output
{
  _id: ObjectId('6787e6758d27284d300d8191'),
  name: 'Max',
  age: 29,
  orders: [ { title: 'A Book', price: 12.99, quantity: 2 } ]
}
