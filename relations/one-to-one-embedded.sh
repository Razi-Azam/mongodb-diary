# One To One Relations - Embedded
# created a hospital database 

# Switch to the 'hospital' database
use hospital

# Query to find a single patient
db.patients.findOne()

# Output
{
  _id: ObjectId('677c1f3835fa05053d0d8191'),
  name: 'max',
  age: 29,
  diseaseSummary: { diseases: [ 'cold', 'broken leg' ] }
}


# The above object shows one to one relationship because 
# the diseaseSummary document is embedded directly 
# inside the parent document. 


# The diseaseSummary is an embedded subdocument
# within the parent document.
# It represents information related to the
# parent (name: max) in a one-to-one manner — 
# i.e., each person has exactly one diseaseSummary.
