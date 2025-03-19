// schema validation

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

