#books collection
db.books.findOne()
{
  _id: ObjectId('6787f8358d27284d300d8194'),
  name: 'My fav Book',
  authors: [
    ObjectId('6787f9428d27284d300d8195'),
    ObjectId('6787f9428d27284d300d8196')
  ]
}

#authors collection
db.authors.find()
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

#combine the authors from authors collection in one
db.books.aggregate([
    {$lookup: {from: "authors", localField: "authors", foreignField: "_id", as: "creators"}}
])

#result
[
  {
    _id: ObjectId('6787f8358d27284d300d8194'),
    name: 'My fav Book',
    authors: [
      ObjectId('6787f9428d27284d300d8195'),
      ObjectId('6787f9428d27284d300d8196')
    ],
    creators: [
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
  }
]
