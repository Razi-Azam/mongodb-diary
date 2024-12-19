//modify the flightData by adding one more field that shows flight delay status
db.flightData.updateOne({_id: ObjectId('6761d05a963d46e6510d8190')}, {$set : {delayed: true}})

db.flightData.find()

/* OUTPUT
[
  {
    _id: ObjectId('6761d05a963d46e6510d8190'),
    departureAirport: 'MUC',
    arrivalAirport: 'SFO',
    aircraft: 'Airbus A380',
    distance: 12000,
    intercontinental: true,
    delayed: true
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


//we can also use 'update' instead of 'updateOne' but
//'update' works like 'updateMany'
db.flightData.update({_id: ObjectId('6761d05a963d46e6510d8190')}, {$set : {delayed: false}})

//NOTE: 'update' is depricated
//Collection.update() is deprecated. Use updateOne, updateMany, or bulkWrite.


//to replcae the existing data without the ID, use 'replcaeOne'
db.flightData.replaceOne({_id: ObjectId('6761d05a963d46e6510d8190')}, {departureAirport: "MUC", arrivalAirport: "SFO", aircraft: "Airbus A380", distance: 12000,intercontinental: true })

/*
*/