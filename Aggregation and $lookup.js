// ==========================================
// 1. Database Selection
// ==========================================
use CompanyDB

// ==========================================
// 2. Matching / Filtering Pipeline Stages ($match)
// ==========================================
// Filter employees belonging to the IT department
db.employees.aggregate([
  { $match: { department: "IT" } }
])

// Filter employees with salary strictly greater than 60,000
db.employees.aggregate([
  { $match: { salary: {$gt: 60000 } } }
])

// ==========================================
// 3. Grouping Pipeline Stage ($group)
// ==========================================
// Group by department and count total employees in each
db.employees.aggregate([
  { 
    $group: { 
      _id: "$department", 
      TotalEmployees: { $sum: 1 } 
    } 
  }
])

// ==========================================
// 4. Projection Pipeline Stage ($project)
// ==========================================
// Reshape output: include name and salary, exclude _id
db.employees.aggregate([
  { 
    $project: { 
      _id: 0, 
      name: 1, 
      salary: 1 
    } 
  }
])

// ==========================================
// 5. Sorting, Pagination & Counting Stages
// ==========================================
// Sort employees by salary in descending order
db.employees.aggregate([
  { $sort: { salary: -1 } }
])

// Limit output to top 3 documents
db.employees.aggregate([
  { $limit: 3 }
])

// Skip the first 3 documents
db.employees.aggregate([
  { $skip: 3 }
])

// Count total documents across the pipeline
db.employees.aggregate([
  { $count: "TotalEmployees" }
])

// ==========================================
// 6. Array Deconstruction Stage ($unwind)
// ==========================================
// Deconstruct the 'skills' array into individual documents per element
db.employees.aggregate([
  { $unwind: "$skills" }
])

// ==========================================
// 7. Global Aggregation Accumulators
// ==========================================
// Calculate total salary expenditure across all employees
db.employees.aggregate([
  { 
    $group: { 
      _id: null, 
      TotalSalary: { $sum: "$salary" } 
    } 
  }
])

// Calculate overall average salary
db.employees.aggregate([
  { 
    $group: { 
      _id: null, 
      AverageSalary: { $avg: "$salary" } 
    } 
  }
])

// Determine lowest salary in company
db.employees.aggregate([
  { 
    $group: { 
      _id: null, 
      MinimumSalary: { $min: "$salary" } 
    } 
  }
])

// Determine highest salary in company
db.employees.aggregate([
  { 
    $group: { 
      _id: null, 
      MaximumSalary: { $max: "$salary" } 
    } 
  }
])

// Collect all employee names into a single list (allows duplicates)
db.employees.aggregate([
  { 
    $group: { 
      _id: null, 
      EmployeeNames: { $push: "$name" } 
    } 
  }
])

// Collect unique city names into a set (removes duplicates)
db.employees.aggregate
