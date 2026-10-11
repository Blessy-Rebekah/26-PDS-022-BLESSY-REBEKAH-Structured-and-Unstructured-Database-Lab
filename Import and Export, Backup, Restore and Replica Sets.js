==============================================================================
 COMPLETE MONGODB REPLICA SET, DATA REPLICATION, BACKUP & RESTORE SCRIPT
==============================================================================

:: STEP 1: VERIFY BINARIES & CREATE DIRECTORIES
cd "C:\Program Files\MongoDB\Server\8.3\bin"
mkdir C:\mongodb\rs1 C:\mongodb\rs2 C:\mongodb\rs3 C:\MongoBackup 2>nul

:: STEP 2: START REPLICA SET NODES (Run each line in a separate CMD terminal)
:: Terminal 1 (Primary Node Target):
:: mongod --port 27017 --dbpath "C:\mongodb\rs1" --replSet rs0

:: Terminal 2 (Secondary Node 1):
:: mongod --port 27018 --dbpath "C:\mongodb\rs2" --replSet rs0

:: Terminal 3 (Secondary Node 2):
:: mongod --port 27019 --dbpath "C:\mongodb\rs3" --replSet rs0

:: ==============================================================================
:: STEP 3: REPLICA SET INITIALIZATION & DATA INSERTION (Run in mongosh: port 27017)
:: ==============================================================================
/*
rs.initiate({
  _id: "rs0",
  members: [
    { _id: 0, host: "127.0.0.1:27017" },
    { _id: 1, host: "127.0.0.1:27018" },
    { _id: 2, host: "127.0.0.1:27019" }
  ]
});

// Check status and node roles
rs.status();
rs.status().members.forEach(m => print(m.name + " : " + m.stateStr));
db.hello();

// Insert sample dataset into Primary
use college;

db.students.insertMany([
    { student_id: 101, name: "Arun", department: "Data Science" },
    { student_id: 102, name: "Priya", department: "Data Science" },
    { student_id: 103, name: "Rahul", department: "Computer Science" }
]);
*/

:: ==============================================================================
:: STEP 4: VERIFY REPLICATION ON SECONDARY (Run in mongosh: port 27018)
:: ==============================================================================
/*
use college;
db.getMongo().setReadPref("secondary");
db.students.find();
*/

:: ==============================================================================
:: STEP 5: BACKUP DATA (Run in CMD)
mongodump --host localhost --port 27017 --db college --out C:\MongoBackup

:: ==============================================================================
:: STEP 6: TEST DATABASE DROP (Run in mongosh: port 27017)
/*
use college;
db.dropDatabase();
show dbs;
*/

:: ==============================================================================
:: STEP 7: RESTORE DATABASE & STOP SERVICE (Run in CMD)
mongorestore --host localhost --port 27017 --db college C:\MongoBackup\college
net stop MongoDB
