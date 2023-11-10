import 'package:flutter/material.dart';
import 'package:firefox2/student.dart'; // Import your student data model
import 'package:firefox2/database_helper.dart';

class StudentDataScreen extends StatelessWidget {
  final Future<List<Student>> students;

  StudentDataScreen({required this.students});

  Future<List<Student>> fetchStudentData() async {
    return await DatabaseHelper.instance.getStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Data'),
      ),
      body: FutureBuilder<List<Student>>(
        future: students,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show a loading indicator
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Student> studentList = snapshot.data!;
            return ListView.builder(
              itemCount: studentList.length,
              itemBuilder: (context, index) {
                // Build a list item for each student
                Student student = studentList[index];
                return ListTile(
                  title: Text(student.name),
                  subtitle: Text('Grade: ${student.grade.toStringAsFixed(2)}, Attendance: ${student.attendance.toStringAsFixed(2)}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
