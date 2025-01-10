# One To One Relation - References
#a One-to-One Relationship (Reference) involves 
# storing related data in separate collections and 
# connecting them via references (usually the _id field).

# Why there is a need to split the data using refrences?
# because If we only interetsted in the cars, there is no
# need to fecth all the persons just to get their cars.

# delete the existing collections
db.persons.deleteMany({})


# Insert data to persons collection
cardData> db.persons.insertOne({name: "Max", age: 29, salary: 3000})


# Create a cars collection that has a reference (_id) to the persons collection.
cardData> db.cars.insertOne({model: "BMW", price: 40000, owner: ObjectId('677d6316b5724109a80d8190')})

# show the persons collection
cardData> db.persons.find()
[
  {
    _id: ObjectId('677d7c19b5724109a80d8191'),
    name: 'Max',
    age: 29,
    salary: 3000
  }
]

# show the cars collection
cardData> db.cars.find()
[
  {
    _id: ObjectId('677d7c8cb5724109a80d8192'),
    model: 'BMW',
    price: 40000,
    owner: ObjectId('677d7c19b5724109a80d8191')
  }
]

# Fetch Owner Information (Using cars Collection)
#without using $lookup or aggregation to extract the owner details 
#from the persons collection using the cars collection, 
#we can do it with two separate queries:

# Step 1: Find the owner ObjectId from the cars collection
cardData> const car = db.cars.findOne({model: "BMW"})

# Extract the owner ObjectId
cardData> const ownerId = car.owner

# show the ownerId
cardData> ownerId
ObjectId('677d7c19b5724109a80d8191')
 
# Step 2: Query the persons collection using the extracted ownerId
cardData> db.persons.findOne({_id: ownerId})

#OUTPUT of the Query:
{
  _id: ObjectId('677d7c19b5724109a80d8191'),
  name: 'Max',
  age: 29,
  salary: 3000
}

