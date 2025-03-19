# Create a simple blog database that contains 
# a post and a user collection

# lets create and switch to a blog database
use blog

# Create a collection named users
db.users.insertMany([{name: "Razi Azam", age: 31, email: "razi@test.com"}, {name: "Aashi Nishat", age: 27, email: "aashi@test.com"}])

# show the users collection
blog> db.users.find()

[
  {
    _id: ObjectId('67b785ce223efa32a94d7942'),
    name: 'Razi Azam',
    age: 31,
    email: 'razi@test.com'
  },
  {
    _id: ObjectId('67b785ce223efa32a94d7943'),
    name: 'Aashi Nishat',
    age: 27,
    email: 'aashi@test.com'
  }
]

# Create a collection named posts
db.posts.insertOne({title: "Hey this is my first post!", text: "This is the first text of mine. I hope you will love it.", tags: ["new", "tech"], creator: ObjectId('67b785ce223efa32a94d7943'), comments: [{text: "I love this post.", author: ObjectId('67b785ce223efa32a94d7942')}]})
{
  acknowledged: true,
  insertedId: ObjectId('67b7877c223efa32a94d7944')
}

# show the posts collection
db.posts.findOne()

{
  _id: ObjectId('67b7877c223efa32a94d7944'),
  title: 'Hey this is my first post!',
  text: 'This is the first text of mine. I hope you will love it.',
  tags: [ 'new', 'tech' ],
  creator: ObjectId('67b785ce223efa32a94d7943'),
  comments: [
    {
      text: 'I love this post.',
      author: ObjectId('67b785ce223efa32a94d7942')
    }
  ]
}

#Now, drop the database posts
db.posts.drop()

# Schema Validation
# Validation is added to the collection at its creation time
# create collection command should be used when
# we want to configure the collection in a special way.


# schema validation

db.createCollection('posts', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      required: ['title', 'text', 'creator', 'comments'],
      properties: {
        title: {
          bsonType: 'string',
          description: "It must be a string and its required",
        },
        text: {
          bsonType: 'string',
          description: "Must be a string and its required",
        },
        creator: {
          bsonType: 'objectId',
          description: "Must be an objectid amd is required",
        },
        comments: {
          bsonType: 'array',
          description: "Must be a string and is required",
          items: {
            bsonType: "object",
            required: ["text", "author"],
            properties: {
              text: {
                bsonType: 'string',
                description: "Must be a string and its required",
              },
              author: {
                bsonType: 'objectId',
                description: "must be an object id and its required",
              }
            }
          }
        }
      }
    }
  }
});


# now insert a document in the posts collection to check wther the validator is working
 db.posts.insertOne({title: "Hey this is my first post!", text: "This is the first text of mine. I hope you will love it.", tags: ["new", "tech"], creator: ObjectId('67b785ce223efa32a94d7943'), comments: [{text: "I love this post.", author: ObjectId('67b785ce223efa32a94d7942')}]})

#OUTPUT
{
  acknowledged: true,
  insertedId: ObjectId('67db0bae16a99d28064d7942')
}

#Its working because the correct data is entered according to the validator.

#Now, let insert another data where the author should not be an object ID which is against the validator
#here, remove the ObjectId and write 13 instead for the author field 
db.posts.insertOne({title: "Hey this is my first post!", text: "This is the first text of mine. I hope you will love it.", tags: ["new", "tech"], creator: ObjectId('67b785ce223efa32a94d7943'), comments: [{text: "I love this post.", author: 13}]})

# OUTPUT - Type didn't match
Uncaught:
MongoServerError: Document failed validation
Additional information: {
  failingDocumentId: ObjectId('67db0cdc16a99d28064d7943'),
  details: {
    operatorName: '$jsonSchema',
    schemaRulesNotSatisfied: [
      {
        operatorName: 'properties',
        propertiesNotSatisfied: [
          {
            propertyName: 'comments',
            description: 'Must be a string and is required',
            details: [
              {
                operatorName: 'items',
                reason: 'At least one item did not match the sub-schema',
                itemIndex: 0,
                details: [
blog>
                    operatorName: 'properties',
                    propertiesNotSatisfied: [
                      {
                        propertyName: 'author',
                        description: 'must be an object id and its required',
                        details: [
                          {
                            operatorName: 'bsonType',
                            specifiedAs: { bsonType: 'objectId' },
                            reason: 'type did not match',
                            consideredValue: 13,
                            consideredType: 'int'
                          }
                        ]
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }
    ]
  }
}


#----------------------------------------------
# CHANGING THE VALIDATION ACTION
#----------------------------------------------

#use runCommand() to chnage the validation
# Here, COllMOd means Collection Modifier

db.runCommand({ 
    collMod: 'posts',
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        required: ['title', 'text', 'creator', 'comments'],
        properties: {
          title: {
            bsonType: 'string',
            description: "It must be a string and its required",
          },
          text: {
            bsonType: 'string',
            description: "Must be a string and its required",
          },
          creator: {
            bsonType: 'objectId',
            description: "Must be an objectid amd is required",
          },
          comments: {
            bsonType: 'array',
            description: "Must be a string and is required",
            items: {
              bsonType: "object",
              required: ["text", "author"],
              properties: {
                text: {
                  bsonType: 'string',
                  description: "Must be a string and its required",
                },
                author: {
                  bsonType: 'objectId',
                  description: "must be an object id and its required",
                }
              }
            }
          }
        }
      }
    },
    validationAction: 'warn'
  });
  
  # Now, try to insert the same incorrect data type of author which is 13
  db.posts.insertOne({title: "Hey this is my first post!", text: "This is the first text of mine. I hope you will love it.", tags: ["new", "tech"], creator: ObjectId('67b785ce223efa32a94d7943'), comments: [{text: "I love this post.", author: 13}]})

  # OUTPUT - this time it did not show any error like above because it has written warning in our log files in system
  {
  acknowledged: true,
  insertedId: ObjectId('67db111c16a99d28064d7944')
}

  