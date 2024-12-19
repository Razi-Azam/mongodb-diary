// Check if flightData collection is empty
db.flightData.find();

//---------Create-----------
// Insert an array of JSON data using insertMany()
db.flightData.insertMany([
  {
    "departureAirport": "MUC",
    "arrivalAirport": "SFO",
    "aircraft": "Airbus A380",
    "distance": 12000,
    "intercontinental": true
  },
  {
    "departureAirport": "LHR",
    "arrivalAirport": "TXL",
    "aircraft": "Airbus A320",
    "distance": 950,
    "intercontinental": false
  }
]);

// Result of the above
/*
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('675b34b792baf4dc3e0d8190'),
    '1': ObjectId('675b34b792baf4dc3e0d8191')
  }
}
*/

//---------Read-----------
// Run the command to view the data in the collection
db.flightData.find();

// Result
/*
[
  {
    _id: ObjectId('675b34b792baf4dc3e0d8190'),
    departureAirport: 'MUC',
    arrivalAirport: 'SFO',
    aircraft: 'Airbus A380',
    distance: 12000,
    intercontinental: true
  },
  {
    _id: ObjectId('675b34b792baf4dc3e0d8191'),
    departureAirport: 'LHR',
    arrivalAirport: 'TXL',
    aircraft: 'Airbus A320',
    distance: 950,
    intercontinental: false
  }
]
*/

//to find a specific data
db.flightData.find({departureAirport: 'MUC'})

/* Output

[
  {
    _id: ObjectId('676070b509fd7cd6750d8190'),
    departureAirport: 'MUC',
    arrivalAirport: 'SFO',
    aircraft: 'Airbus A380',
    distance: 12000,
    intercontinental: true
  }
]

*/


// Add one more data
db.flightData.insertOne({departureAirport: "TXL", arrivalAirport: "LHR"})

//view the collection
db.flightData.find()
/* 

[
  {
    _id: ObjectId('676070b509fd7cd6750d8190'),
    departureAirport: 'MUC',
    arrivalAirport: 'SFO',
    aircraft: 'Airbus A380',
    distance: 12000,
    intercontinental: true
  },
  {
    _id: ObjectId('676070b509fd7cd6750d8191'),
    departureAirport: 'LHR',
    arrivalAirport: 'TXL',
    aircraft: 'Airbus A320',
    distance: 950,
    intercontinental: false
  },
  {
    _id: ObjectId('6760723c09fd7cd6750d8192'),
    departureAirport: 'TXL',
    arrivalAirport: 'LHR',
    marker: 'delete'
  }
]

*/

//---------Update-----------
// Update Many
db.flightData.updateMany({}, {$set : {marker: "toDelete"}})

/*

[
  {
    _id: ObjectId('676070b509fd7cd6750d8190'),
    departureAirport: 'MUC',
    arrivalAirport: 'SFO',
    aircraft: 'Airbus A380',
    distance: 12000,
    intercontinental: true,
    marker: 'toDelete'
  },
  {
    _id: ObjectId('676070b509fd7cd6750d8191'),
    departureAirport: 'LHR',
    arrivalAirport: 'TXL',
    aircraft: 'Airbus A320',
    distance: 950,
    intercontinental: false,
    marker: 'toDelete'
  },
  {
    _id: ObjectId('6760723c09fd7cd6750d8192'),
    departureAirport: 'TXL',
    arrivalAirport: 'LHR',
    marker: 'toDelete'
flightData>
]

*/

//---------Delete-----------
//delete Many
db.flightData.deleteMany({marker: "toDelete"})

/* { acknowledged: true, deletedCount: 3 } */
db.flightData.find()