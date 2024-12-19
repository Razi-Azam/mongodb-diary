//show flightData
db.flightData.find()
/*
[
  {
    _id: ObjectId('6761d05a963d46e6510d8190'),
    departureAirport: 'MUC',
    arrivalAirport: 'SFO',
    aircraft: 'Airbus A380',
    distance: 12000,
    intercontinental: true
  },
  {
    _id: ObjectId('6761d05a963d46e6510d8191'),
    departureAirport: 'LHR',
    arrivalAirport: 'TXL',
    aircraft: 'Airbus A320',
    distance: 950,
    intercontinental: false
  },
  {
    _id: ObjectId('6761d0ad963d46e6510d8192'),
    departureAirport: 'TXL',
    arrivalAirport: 'LHR',
    distance: 700,
    intercontinental: false
  }
]
*/

/*Find all flights with a distance > 10000 KM
here, we have a special word reserved for MongoDB is
$gt which means 'greater than' */

db.flightData.find({distance: {$gt : 10000}})

/* OUTPUT
[
  {
    _id: ObjectId('6761d05a963d46e6510d8190'),
    departureAirport: 'MUC',
    arrivalAirport: 'SFO',
    aircraft: 'Airbus A380',
    distance: 12000,
    intercontinental: true
  }
]

*/

/*---------find()  vs findOne()---------------
find() shows all the matchings values as per the filter but
findOne() will show only the first occurrence of the result. */

/* find() */
db.flightData.find({distance: {$gt : 900}})

/* OUTPUT
[
  {
    _id: ObjectId('6761d05a963d46e6510d8190'),
    departureAirport: 'MUC',
    arrivalAirport: 'SFO',
    aircraft: 'Airbus A380',
    distance: 12000,
    intercontinental: true
  },
  {
    _id: ObjectId('6761d05a963d46e6510d8191'),
    departureAirport: 'LHR',
    arrivalAirport: 'TXL',
    aircraft: 'Airbus A320',
    distance: 950,
    intercontinental: false
  }
]
*/

/* findOne() */
db.flightData.findOne({distance: {$gt : 900}})

/* OUTPUT
{
  _id: ObjectId('6761d05a963d46e6510d8190'),
  departureAirport: 'MUC',
  arrivalAirport: 'SFO',
  aircraft: 'Airbus A380',
  distance: 12000,
  intercontinental: true
}
*/

/*---------**find() and the cursor object-----------------------*/

db.passengers.find().forEach(passengerData => {printjson(passengerData)})

/*
result is same as passenger.json file in the dummy-data folder */


/* ------------- PROJECTION ---------------------------*/

db.passengers.find({}, {name: 1})

/* --------------- OUTPUT -----------------------------

[
  {
    _id: ObjectId('676466ddca4a7a43170d8190'),
    name: 'Max Schwarzmueller'
  },
  { _id: ObjectId('676466ddca4a7a43170d8191'), name: 'Manu Lorenz' },
  { _id: ObjectId('676466ddca4a7a43170d8192'), name: 'Chris Hayton' },
  { _id: ObjectId('676466ddca4a7a43170d8193'), name: 'Sandeep Kumar' },
  { _id: ObjectId('676466ddca4a7a43170d8194'), name: 'Maria Jones' },
  {
    _id: ObjectId('676466ddca4a7a43170d8195'),
    name: 'Alexandra Maier'
  },
  { _id: ObjectId('676466ddca4a7a43170d8196'), name: 'Dr. Phil Evans' },
  { _id: ObjectId('676466ddca4a7a43170d8197'), name: 'Sandra Brugge' },
  { _id: ObjectId('676466ddca4a7a43170d8198'), name: 'Elisabeth Mayr' },
  { _id: ObjectId('676466ddca4a7a43170d8199'), name: 'Frank Cube' },
  { _id: ObjectId('676466ddca4a7a43170d819a'), name: 'Karandeep Alun' },
  {
    _id: ObjectId('676466ddca4a7a43170d819b'),
    name: 'Michaela Drayer'
  },
  {
    _id: ObjectId('676466ddca4a7a43170d819c'),
    name: 'Bernd Hoftstadt'
  },
  { _id: ObjectId('676466ddca4a7a43170d819d'), name: 'Scott Tolib' },
  { _id: ObjectId('676466ddca4a7a43170d819e'), name: 'Freddy Melver' },
  { _id: ObjectId('676466ddca4a7a43170d819f'), name: 'Alexis Bohed' },
  { _id: ObjectId('676466ddca4a7a43170d81a0'), name: 'Melanie Palace' },
  { _id: ObjectId('676466ddca4a7a43170d81a1'), name: 'Armin Glutch' },
  { _id: ObjectId('676466ddca4a7a43170d81a2'), name: 'Klaus Arber' },
  {
    _id: ObjectId('676466ddca4a7a43170d81a3'),
    name: 'Albert Twostone'
  }
]
Type "it" for more
passengers> it
[ { _id: ObjectId('676466ddca4a7a43170d81a4'), name: 'Gordon Black' } ]

*/

// to exclude tthe _id field, use _id: 0
db.passengers.find({}, {name: 1, _id: 0})


/* --------------- OUTPUT -----------------------------

[
  { name: 'Max Schwarzmueller' },
  { name: 'Manu Lorenz' },
  { name: 'Chris Hayton' },
  { name: 'Sandeep Kumar' },
  { name: 'Maria Jones' },
  { name: 'Alexandra Maier' },
  { name: 'Dr. Phil Evans' },
  { name: 'Sandra Brugge' },
  { name: 'Elisabeth Mayr' },
  { name: 'Frank Cube' },
  { name: 'Karandeep Alun' },
  { name: 'Michaela Drayer' },
  { name: 'Bernd Hoftstadt' },
  { name: 'Scott Tolib' },
  { name: 'Freddy Melver' },
  { name: 'Alexis Bohed' },
  { name: 'Melanie Palace' },
  { name: 'Armin Glutch' },
  { name: 'Klaus Arber' },
  { name: 'Albert Twostone' }
]

*/