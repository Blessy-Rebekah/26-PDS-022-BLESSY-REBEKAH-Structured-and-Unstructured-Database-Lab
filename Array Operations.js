// ==========================================
// 1. Database Selection & Collection Setup
// ==========================================
use CollegeDB

// Drop existing collection to reset state
db.students.drop()

// ==========================================
// 2. Data Insertion with Array Fields
// ==========================================
db.students.insertMany([
  { 
    student_id: 101, 
    name: "Arun", 
    department: "Data Science", 
    skills: ["Python", "SQL", "MongoDB"], 
    hobbies: ["Reading", "Cricket"] 
  },
  { 
    student_id: 102, 
    name: "Priya", 
    department: "Data Science", 
    skills: ["Python", "Machine Learning", "MongoDB"], 
    hobbies: ["Music", "Drawing"] 
  },
  { 
    student_id: 103, 
    name: "Karthik", 
    department: "Artificial Intelligence", 
    skills: ["Python", "Deep Learning", "SQL"], 
    hobbies: ["Cricket", "Gaming"] 
  },
  { 
    student_id: 104, 
    name: "Divya", 
    department: "Data Science", 
    skills: ["R", "Python", "Statistics"], 
    hobbies: ["Reading", "Music"] 
  },
  { 
    student_id: 105, 
    name: "Rahul", 
    department: "Artificial Intelligence", 
    skills: ["Python", "TensorFlow", "Deep Learning"], 
    hobbies: ["Gaming", "Football"] 
  }
])

// ==========================================
// 3. Array Query Operators ($all,$in, $size,$nin)
// ==========================================
// Find students possessing "Python" in skills array
db.students.find({ skills: "Python" })

// Find students containing BOTH "Python" and "SQL" ($all)
db.students.find({ skills: { $all: ["Python", "SQL"] } })

// Find students containing EITHER "Python" OR "MongoDB" ($in)
db.students.find({ skills: { $in: ["Python", "MongoDB"] } })

// Find students with exactly 3 skills ($size)
db.students.find({ skills: { $size: 3 } })

// Find students possessing NEITHER "MongoDB" NOR "SQL" ($nin)
db.students.find({ skills: { $nin: ["MongoDB", "SQL"] } })

// ==========================================
// 4. Array Modification Operators ($push, $pull,$pullAll)
// ==========================================
// Append multiple elements to 'skills' array using $push and$each
db.students.updateOne(
  { student_id: 102 },
  { $push: { skills: {$each: ["Deep Learning", "Statistics"] } } }
)

// Remove single matching element ("Java") from 'skills' array using $pull
db.students.updateOne(
  { student_id: 101 },
  { $pull: { skills: "Java" } }
)

// Remove multiple specific elements from 'skills' array using $pullAll
db.students.updateOne(
  { student_id: 101 },
  { $pullAll: { skills: ["Python", "SQL"] } }
)

// Insert element at specific array index (position 1) using $position
db.students.updateOne(
  { student_id: 102 },
  { $push: { skills: { $each: ["Java"], $position: 1 } } }
)

// Append items and cap total array size to last 3 elements using $slice
db.students.updateOne(
  { student_id: 103 },
  { $push: { skills: { $each: ["AWS", "Docker"], $slice: -3 } } }
)

// ==========================================
// 5. Embedded Document Arrays & $elemMatch Query
// ==========================================
// Attach array of embedded documents
