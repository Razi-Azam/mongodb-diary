//flightData
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

//Find all flights with a distance > 10000 KM
//here, we have a special word reserved for MongoDB is
//$gt which means 'greater than'

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

//---------find()  vs findOne()---------------
//find() shows all the matchings values as per the filter but
//findOne() will show only the first occurrence of the result.

//find()
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

//findOne()
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

//---------**find() and the cursor object-----------------------

db.passengers.find().forEach(passengerData => {printjson(passengerData)})

/*

result is same as passenger.json file in the dummy-data folder */



