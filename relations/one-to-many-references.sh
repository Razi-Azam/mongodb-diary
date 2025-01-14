#One to Many Relation - Refrences

#questions collection:
db.questions.insertMany([
  {
    _id: ObjectId("64a1c5e3b19a1234d5678a01"),
    questionText: "What is the capital of France?"
  },
  {
    _id: ObjectId("64a1c5e3b19a1234d5678a02"),
    questionText: "Which programming language is known as 'write once, run anywhere'?"
  },
  {
    _id: ObjectId("64a1c5e3b19a1234d5678a03"),
    questionText: "Which planet is known as the Red Planet?"
  }
]);


#answers collection:
db.answers.insertMany([
  {
    _id: ObjectId("64a1c5e3b19a1234d5678b01"),
    answerText: "Paris",
    questionId: ObjectId("64a1c5e3b19a1234d5678a01")
  },
  {
    _id: ObjectId("64a1c5e3b19a1234d5678b02"),
    answerText: "Java",
    questionId: ObjectId("64a1c5e3b19a1234d5678a02")
  },
  {
    _id: ObjectId("64a1c5e3b19a1234d5678b03"),
    answerText: "Mars",
    questionId: ObjectId("64a1c5e3b19a1234d5678a03")
  },
  {
    _id: ObjectId("64a1c5e3b19a1234d5678b04"),
    answerText: "C++",
    questionId: ObjectId("64a1c5e3b19a1234d5678a02")
  }
]);


#show question collection
 db.questions.find()
[
  {
    _id: ObjectId('64a1c5e3b19a1234d5678a01'),
    questionText: 'What is the capital of France?'
  },
  {
    _id: ObjectId('64a1c5e3b19a1234d5678a02'),
    questionText: "Which programming language is known as 'write once, run anywhere'?"
  },
  {
    _id: ObjectId('64a1c5e3b19a1234d5678a03'),
    questionText: 'Which planet is known as the Red Planet?'
  }
]

#show answer collection
db.answers.find()
[
  {
    _id: ObjectId('64a1c5e3b19a1234d5678b01'),
    answerText: 'Paris',
    questionId: ObjectId('64a1c5e3b19a1234d5678a01')
  },
  {
    _id: ObjectId('64a1c5e3b19a1234d5678b02'),
    answerText: 'Java',
    questionId: ObjectId('64a1c5e3b19a1234d5678a02')
  },
  {
    _id: ObjectId('64a1c5e3b19a1234d5678b03'),
    answerText: 'Mars',
    questionId: ObjectId('64a1c5e3b19a1234d5678a03')
  },
  {
    _id: ObjectId('64a1c5e3b19a1234d5678b04'),
    answerText: 'C++',
    questionId: ObjectId('64a1c5e3b19a1234d5678a02')
  }
]

#query to fetch all answers for 
#Question 2 ("Which programming language is 
#known as 'write once, run anywhere'?").

# Step 1: Find the question ID
const question = db.questions.findOne({questionText: "Which programming language is known as 'write once, run anywhere'?"})

const questionId = question._id

questionId

ObjectId('64a1c5e3b19a1234d5678a02')

#Step 2: Find answers related to the question ID
const answers = db.answers.find({questionId: questionId }).toArray();

#print the output in JSON format
printjson(answers)

#output
[
  {
    _id: ObjectId('64a1c5e3b19a1234d5678b02'),
    answerText: 'Java',
    questionId: ObjectId('64a1c5e3b19a1234d5678a02')
  },
  {
    _id: ObjectId('64a1c5e3b19a1234d5678b04'),
    answerText: 'C++',
    questionId: ObjectId('64a1c5e3b19a1234d5678a02')
  }
]