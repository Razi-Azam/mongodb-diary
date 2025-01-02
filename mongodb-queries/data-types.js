// showing Data types in MongoDB
// use companyData
// switched to db companyData
db.companies.insertOne({name: "Fresh Apple Inc", isStartup: true, employees: 33, funding: 1234567890123456789, details: {ceo: "Mark Super"}, tags: [{title: "super"}, {title: "perfect"}], foundingDate: new Date(), insertedAt: new Timestamp()})

/*
db.companies.findOne()
{
  _id: ObjectId('6776d7c98fd6938ff60d8190'),
  name: 'Fresh Apple Inc',
  isStartup: true,
  employees: 33,
  funding: 1234567890123456800,
  details: { ceo: 'Mark Super' },
  tags: [ { title: 'super' }, { title: 'perfect' } ],
  foundingDate: ISODate('2025-01-02T18:15:37.072Z'),
  insertedAt: Timestamp({ t: 1735841737, i: 1 })
}
companyData> db.numbers.insertOne({a: 1})
{
  acknowledged: true,
  insertedId: ObjectId('6776da918fd6938ff60d8191')
}

*/

/* OUTPUT
 db.companies.findOne()
{
  _id: ObjectId('6776d7c98fd6938ff60d8190'),
  name: 'Fresh Apple Inc',
  isStartup: true,
  employees: 33,
  funding: 1234567890123456800,
  details: { ceo: 'Mark Super' },
  tags: [ { title: 'super' }, { title: 'perfect' } ],
  foundingDate: ISODate('2025-01-02T18:15:37.072Z'),
  insertedAt: Timestamp({ t: 1735841737, i: 1 })
}
*/

//to know the statistic, use db.stats
db.numbers.findOne()

// 
db.numbers.findOne()
// { _id: ObjectId('6776da918fd6938ff60d8191'), a: 1 }

// statistics of selected DB
/*
 db.stats()
{
  db: 'companyData',
  collections: Long('2'),
  views: Long('0'),
  objects: Long('2'),
  avgObjSize: 130,
  dataSize: 260,
  storageSize: 24576,
  indexes: Long('2'),
  indexSize: 24576,
  totalSize: 49152,
  scaleFactor: Long('1'),
  fsUsedSize: 99610882048,
  fsTotalSize: 506332180480,
  ok: 1
}

*/


//delete all
db.numbers.deleteMany({})

/*
{ acknowledged: true, deletedCount: 1 }
*/

//Now, check the stats again
/*

{
  db: 'companyData',
  collections: Long('1'),
  views: Long('0'),
  objects: Long('0'),
  avgObjSize: 0,
  dataSize: 0,
  storageSize: 24576,
  indexes: Long('1'),
  indexSize: 24576,
  totalSize: 49152,
  scaleFactor: Long('1'),
  fsUsedSize: 99618062336,
  fsTotalSize: 506332180480,
  ok: 1
}

*/


//to optimze the num value, use numberInt()
/*
{
  db: 'companyData',
  collections: Long('1'),
  views: Long('0'),
  objects: Long('1'),
  avgObjSize: 29,
  dataSize: 29,
  storageSize: 24576,
  indexes: Long('1'),
  indexSize: 24576,
  totalSize: 49152,
  scaleFactor: Long('1'),
  fsUsedSize: 99617751040,
  fsTotalSize: 506332180480,
  ok: 1
}

*/


// to know the type
typeof db.numbers.findOne().a