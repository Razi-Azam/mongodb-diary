# Many to Many Relations - Refrences

#create a database
use bookRegistry

#create a books collection having authors details 
db.books.insertOne({name: "My fav Book", authors: [{name: "", age: 29}] })

db.books.find()
#output
[
  {
    _id: ObjectId('6787f8358d27284d300d8194'),
    name: 'My fav Book',
    authors: [ { name: '', age: 29 } ]
  }
]

#create authors collection
db.authors.insertMany([{name: "Max Schwarz", age: 29, address: {street: "Main"}}, {name: "Manual Lor", age: 30, address: {street: "Tree"}} ])

db.authors.find()

#output
[
  {
    _id: ObjectId('6787f9428d27284d300d8195'),
    name: 'Max Schwarz',
    age: 29,
    address: { street: 'Main' }
  },
  {
    _id: ObjectId('6787f9428d27284d300d8196'),
    name: 'Manual Lor',
    age: 30,
    address: { street: 'Tree' }
  }
]

# now, update the authors details in books collection 
#using reference form
#keep only id of the authors as references
db.books.updateOne({}, {$set: {authors: [ObjectId('6787f9428d27284d300d8195'), ObjectId('6787f9428d27284d300d8196')]}})

db.books.findOne()

#output
{
  _id: ObjectId('6787f8358d27284d300d8194'),
  name: 'My fav Book',
  authors: [
    ObjectId('6787f9428d27284d300d8195'),
    ObjectId('6787f9428d27284d300d8196')
  ]
}