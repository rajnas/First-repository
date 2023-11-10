import 'package:firefox2/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:firefox2/Screens/student_data_screen.dart';
import 'package:firefox2/Screens/enter_data_screen.dart';
import 'package:firefox2/student.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational Data Analytics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Student Data Analytics',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                List<Student> students = await fetchStudentData();
                navigateToStudentData(context, students);
              },
              child: Text('View Student Data'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnterDataScreen()),
                );
              },
              child: Text('Enter New Data'),
            ),
          ],
        ),
      ),
    );
  }
 
  Future<List<Student>> fetchStudentData() async {
    List<Student> students = await DatabaseHelper.instance.getStudents();
    return students;
  }

  void navigateToStudentData(BuildContext context, List<Student> students) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StudentDataScreen(students: students)),
    );
  }
}
