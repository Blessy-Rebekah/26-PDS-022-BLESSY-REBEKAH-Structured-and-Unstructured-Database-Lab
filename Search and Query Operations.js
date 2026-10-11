// ==========================================
// 1. Database Selection
// ==========================================
use studentDB

// ==========================================
// 2. Comparison Operators ($gt, $gte, $lte)
// ==========================================
// Filter students with CGPA strictly greater than 9.0
db.students.find({ 
  cgpa: { $gt: 9 } 
})

// Filter students with CGPA within range [8.5, 9.5]
db.students.find({ 
  cgpa: { $gte: 8.5, $lte: 9.5 } 
})

// ==========================================
// 3. Set Operators ($in, $nin)
// ==========================================
// Filter students belonging to either "AI" or "Data Science"
db.students.find({ 
  department: { $in: ["AI", "Data Science"] } 
})

// Filter students NOT belonging to "AI"
db.students.find({ 
  department: { $nin: ["AI"] } 
})

// ==========================================
// 4. Logical Operators ($and, $or)
// ==========================================
// Filter students who are at least 20 years old AND have CGPA > 8.0
db.students.find({ 
  $and: [
    { age: { $gte: 20 } }, 
    { cgpa: { $gt: 8 } }
  ] 
})

// Filter students who belong to "AI" OR have CGPA > 9.0
db.students.find({ 
  $or: [
    { department: "AI" }, 
    { cgpa: { $gt: 9 } }
  ] 
})

// ==========================================
// 5. Pattern Matching ($regex) & Sorting/Pagination
// ==========================================
// Filter students whose name starts with 'A' (case-insensitive)
db.students.find({ 
  name: { $regex: /^A/i } 
})

// Top 3 students with highest CGPA (sorted descending)
db.students.find()
  .sort({ cgpa: -1 })
  .limit(3)
