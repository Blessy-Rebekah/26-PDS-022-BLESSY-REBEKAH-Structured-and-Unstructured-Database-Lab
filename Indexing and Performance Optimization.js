// ==========================================
// 1. Database Selection & Collection Reset
// ==========================================
use CollegeDB

// Drop existing collection to clear previous indexes and data
db.students.drop()

// ==========================================
// 2. Data Insertion
// ==========================================
db.students.insertMany([ 
  { student_id: 101, name: "Arun", department: "Data Science", age: 22, marks: 85 }, 
  { student_id: 102, name: "Priya", department: "Computer Science", age: 21, marks: 90 }, 
  { student_id: 103, name: "Rahul", department: "Data Science", age: 23, marks: 78 }, 
  { student_id: 104, name: "Divya", department: "Information Technology", age: 22, marks: 88 }, 
  { student_id: 105, name: "Karthik", department: "Computer Science", age: 24, marks: 75 } 
])

// ==========================================
// 3. Single-Field Indexes & Execution Analysis
// ==========================================
// Create single-field ascending index on 'name'
db.students.createIndex({ name: 1 })

// View all existing indexes on the collection
db.students.getIndexes()

// Query using the indexed 'name' field
db.students.find({ name: "Priya" })

// Analyze query performance and execution stats (IXSCAN vs COLLSCAN)
db.students.find({ name: "Priya" }).explain("executionStats")

// Create single-field descending index on 'marks'
db.students.createIndex({ marks: -1 })

// ==========================================
// 4. Compound Index & Sorted Query
// ==========================================
// Create compound index: 'department' (Ascending) + 'marks' (Descending)
db.students.createIndex({ department: 1, marks: -1 })

// Query utilizing compound index for filtering and sorted output
db.students.find({ department: "Data Science" }).sort({ marks: -1 })

// ==========================================
// 5. Unique Index Constraint
// ==========================================
// Create unique index to enforce distinct 'student_id' values
db.students.createIndex({ student_id: 1 }, { unique: true })

// ==========================================
// 6. Index Management & Deletion
// ==========================================
// Inspect updated indexes list
db.students.getIndexes()

// Drop index by its generated name ('name_1')
db.students.dropIndex("name_1")
