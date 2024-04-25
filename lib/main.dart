import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          hintColor: Colors.cyan),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String studentName, studentID, studyProgramID;
  late double studentGPA;

  getStudentName(name) {
    this.studentName = name;
  }
  getStudentID(id) {
    this.studentID = id;
  }
  getStudyProgramID(programID) {
    this.studyProgramID = programID;
  }

  getStudentGPA(gpa) {
    this.studentGPA = double.parse(gpa);
  }

  createData(){
    print("created");

    //firestore code
    DocumentReference documentReference = FirebaseFirestore.instance.collection("MyStudents").doc(studentName);
    //create Map: Map is a collection of key and value from which we retrieve a value using its associated key
    Map<String, dynamic> students={
     "studentName": studentName,
      "studentID": studentID,
      "studyProgramID": studyProgramID,
      "studentGPA": studentGPA
    };

    //send the above created Map to documentReference
    // Send the above created Map to documentReference
    documentReference.set(students).then((_) {
      print("$studentName created");
    }).catchError((error) {
      print("Failed to create $studentName: $error");
    });


  }
  readData(){
    print("read");
  }
  updateData(){
    print("updated");
  }
  deleteData(){
    print("deleted");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Flutter College"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Name",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String name){
                  getStudentName(name);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Student ID",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String id){
                  getStudentID(id);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Study Program ID",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String programID){
                  getStudyProgramID(programID);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "GPA",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String gpa){
                  getStudentGPA(gpa);
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                ElevatedButton(
                  onPressed: () {
                    // Add your onPressed function here
                    createData();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0), // Set border radius here
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Set background color here
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color here
                    overlayColor: MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.5)), // Set overlay color when pressed
                    // You can customize other properties like padding, elevation, etc. here
                  ),
                  child: Text('Create', style: TextStyle(color: Colors.white), ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your onPressed function here
                    readData();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0), // Set border radius here
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent), // Set background color here
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color here
                    overlayColor: MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.5)), // Set overlay color when pressed
                    // You can customize other properties like padding, elevation, etc. here
                  ),
                  child: Text('Read', style: TextStyle(color: Colors.white), ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your onPressed function here
                    updateData();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0), // Set border radius here
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.purple), // Set background color here
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color here
                    overlayColor: MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.5)), // Set overlay color when pressed
                    // You can customize other properties like padding, elevation, etc. here
                  ),
                  child: Text('Update', style: TextStyle(color: Colors.white), ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your onPressed function here
                    deleteData();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0), // Set border radius here
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent), // Set background color here
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color here
                    overlayColor: MaterialStateProperty.all<Color>(Colors.blue.withOpacity(0.5)), // Set overlay color when pressed
                    // You can customize other properties like padding, elevation, etc. here
                  ),
                  child: Text('Delete', style: TextStyle(color: Colors.white), ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
