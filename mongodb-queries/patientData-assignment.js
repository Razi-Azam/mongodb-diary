//Q 1. Insert 3 patient records with at least 1 history per patient.
// use patientData

db.patientData.insertMany([
    {
        "firstName": "Amogh",
        "lastName": "Rawat",
        "age": 27,
        "history": [
            {
                "disease": "fever",
                "treatment": "Paracetamol tablets"
            }
        ]
    },
    {
        "firstName": "Bhagyashree",
        "lastName": "Pati",
        "age": 30,
        "history": [
            {
                "disease": "Dental Issue",
                "treatment": "RCT"
            }
        ]
    },
    {
        "firstName": "Nick",
        "lastName": "Jones",
        "age": 31,
        "history": [
            {
                "disease": "Hair Fall",
                "treatment": "Hair Spa"
            }
        ]
    }
])


//Q2. Update patinet data of 1 patient with new age, name, and history entry.
db.patientData.updateOne({firstName: 'Nick'}, {$set: {firstName: 'John', lastName: 'Cena', age: 29, history: [{disease: 'cold', treatment: 'medicine'}]}})

db.patientData.find()
/*---------- OUTPUT -------------------

[
  {
    _id: ObjectId('67648091ef8ab629f20d8190'),
    firstName: 'Amogh',
    lastName: 'Rawat',
    age: 27,
    history: [ { disease: 'fever', treatment: 'Paracetamol tablets' } ]
  },
  {
    _id: ObjectId('67648091ef8ab629f20d8191'),
    firstName: 'Bhagyashree',
    lastName: 'Pati',
    age: 30,
    history: [ { disease: 'Dental Issue', treatment: 'RCT' } ]
  },
  {
    _id: ObjectId('67648091ef8ab629f20d8192'),
    firstName: 'John',
    lastName: 'Cena',
    age: 29,
    history: [ { disease: 'cold', treatment: 'medicine' } ]
  }
]
*/

//Q3. Find all patients who 
// are older than 30 (or a value of your choice)
db.patientData.find({age: {$gt: 29}})

/*----------- OUTPUT-----------------
[
  {
    _id: ObjectId('67648091ef8ab629f20d8191'),
    firstName: 'Bhagyashree',
    lastName: 'Pati',
    age: 30,
    history: [ { disease: 'Dental Issue', treatment: 'RCT' } ]
  }
]
*/