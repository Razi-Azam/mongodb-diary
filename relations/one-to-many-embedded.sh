#One to Many Relation - Embedded

db.questions.insertMany([
  {
    _id: ObjectId("64a1c5e3b19a1234d5678a01"),
    questionText: "What is the capital of France?",
    answers: [
      { _id: ObjectId("64a1c5e3b19a1234d5678b01"), answerText: "Paris" }
    ]
  },
  {
    _id: ObjectId("64a1c5e3b19a1234d5678a02"),
    questionText: "Which programming language is known as 'write once, run anywhere'?",
    answers: [
      { _id: ObjectId("64a1c5e3b19a1234d5678b02"), answerText: "Java" },
      { _id: ObjectId("64a1c5e3b19a1234d5678b04"), answerText: "C++" }
    ]
  },
  {
    _id: ObjectId("64a1c5e3b19a1234d5678a03"),
    questionText: "Which planet is known as the Red Planet?",
    answers: [
      { _id: ObjectId("64a1c5e3b19a1234d5678b03"), answerText: "Mars" }
    ]
  }
]);


#show the collection
db.questions.find()

#output
[
  {
    _id: ObjectId('64a1c5e3b19a1234d5678a01'),
    questionText: 'What is the capital of France?',
    answers: [
      {
        _id: ObjectId('64a1c5e3b19a1234d5678b01'),
        answerText: 'Paris'
      }
    ]
  },
  {
    _id: ObjectId('64a1c5e3b19a1234d5678a02'),
    questionText: "Which programming language is known as 'write once, run anywhere'?",
    answers: [
      { _id: ObjectId('64a1c5e3b19a1234d5678b02'), answerText: 'Java' },
      { _id: ObjectId('64a1c5e3b19a1234d5678b04'), answerText: 'C++' }
    ]
  },
  {
    _id: ObjectId('64a1c5e3b19a1234d5678a03'),
    questionText: 'Which planet is known as the Red Planet?',
    answers: [
      { _id: ObjectId('64a1c5e3b19a1234d5678b03'), answerText: 'Mars' }
    ]
  }
]