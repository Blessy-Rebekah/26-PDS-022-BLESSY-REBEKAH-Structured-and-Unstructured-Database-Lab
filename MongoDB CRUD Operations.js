// ==========================================
// 1. Database & Collection Setup
// ==========================================
use studentDB

// Drop existing collection to reset state
db.students.drop()

// Create new students collection
db.createCollection("students")

// ==========================================
// 2. Data Insertion (insertMany)
// ==========================================
db.students.insertMany([
  { rollNo: 101, name: "John", age: 20, department: "Data Science", cgpa: 8.9 },
  { rollNo: 102, name: "Alice", age: 21, department: "AI", cgpa: 9.1 },
  { rollNo: 103, name: "David", age: 22, department: "Computer Science", cgpa: 8.5 },
  { rollNo: 104, name: "Sophia", age: 20, department: "Cyber Security", cgpa: 9.3 }
])

// ==========================================
// 3. Document Querying & Projections
// ==========================================
// Retrieve all records
db.students.find()

// Find first single document matching criteria
db.students.findOne({ name: "John" })

// Filter documents with CGPA greater than 9.0
db.students.find({ cgpa: { $gt: 9 } })

// Projection: Display only name and department (exclude _id)
db.students.find({}, { _id: 0, name: 1, department: 1 })

// ==========================================
// 4. Updating Documents ($set & $inc)
// ==========================================
// Update CGPA for roll number 101
db.students.updateOne(
  { rollNo: 101 },
  { $set: { cgpa: 9.2 } }
)

// Increment age by 1 for all students aged 20
db.students.updateMany(
  { age: 20 },
  { $inc: { age: 1 } }
)

// Inspect updated documents
db.students.find()

// ==========================================
// 5. Deleting Documents & Aggregation
// ==========================================
// Delete single document matching roll number 104
db.students.deleteOne({ rollNo: 104 })

// Delete all documents with CGPA less than 9.0
db.students.deleteMany({ cgpa: { $lt: 9 } })

// Count remaining documents in collection
db.students.countDocuments()
