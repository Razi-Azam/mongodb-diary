# MongoDB Diary

### This repository contains my notes and code from my MongoDB learning journey.

## Contents:

1. [Get Started with Mongosh](#connect-to-the-mongodb-instance)

2. 



## Connect to the MongoDB instance
```
mongosh
```

or

```
"C:\Program Files\MongoDB\mongosh.exe"
```

NOTE: 📝 In previous version (older than 5.0), mongo.exe need to be executed. But we don’t need to manually run mongo.exe anymore because the MongoDB Shell (mongosh) has replaced the legacy mongo.exe as the default shell.

### Get Started
- View the default database.
```
show dbs
```
- Connect the databse using "use" command.
```
use shop
```
- Create a new collection in the shop database.
- Here, ```db``` refers to the selected database which is shop, ```products``` is the new collection which is to be created, and ```insertOne``` command is used for inserting a new data.
- A pair of curly braces inside the insertOne command refers to the JSON object.

```javaScript
db.products.insertOne({name: "A Story Book", price: 19.99})
```

- Now, run the "find()" command to see all the data in the products.

```javaScript
db.products.find()
```

- MongoDB automatically generates a unique id.
![alt text](image.png)


- The pretty() method in MongoDB is used to format the output of the find() query in a more readable and well-structured JSON-like format.
```javaScript
db.products.find().pretty()
```

NOTE:📝
In mongosh (MongoDB Shell), pretty() isn't always necessary because the output is automatically formatted for better readability.

### Add nested field "details" in the products collection.
```javaScript
db.products.insertOne({name: "A Computer", price: 1229.99, description: "A high quality computer", details: { cpu: "Intel i7 8770", memory: 32}})
```
![alt text](image-1.png)



### Shell vs Drivers
| MongoDB Shell | MongoDB Drivers |
| ---- | ---- |
| A command-line tool for directly interacting with MongoDB. Used for querying, database administration, and testing. It's ideal for manual operations and uses JavaScript for commands. | Programming language-specific libraries (e.g., Node.js, Python, Java) that allow applications to interact with MongoDB programmatically. Used for building and automating database interactions in apps. |



| **Aspect**              | **MongoDB Shell**                          | **MongoDB Drivers**                          |
|-------------------------|--------------------------------------------|----------------------------------------------|
| **Purpose**             | Manual interaction with MongoDB            | Programmatic interaction from an application |
| **Usage**               | Querying, debugging, admin tasks           | Building apps to interact with MongoDB       |
| **Environment**         | CLI (command line)                         | Application environment (e.g., backend code) |
| **Language**            | JavaScript (shell commands)                | Language of the app (e.g., Python, Java)     |
| **Best For**            | Quick queries, testing, troubleshooting    | Application development and automation       |
| **Installation**        | Comes with MongoDB installation            | Installed separately for the specific language |
| **Connection Lifespan** | Temporary (used while running the shell)   | Persistent (maintained for app functionality) |
| **Performance**         | Manual, one-time operations                | High-performance API for automated tasks     |









[Go to Top ⬆️ ](#contents)

---