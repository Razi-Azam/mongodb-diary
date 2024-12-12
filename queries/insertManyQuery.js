// Check if flightData collection is empty
db.flightData.find();

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
