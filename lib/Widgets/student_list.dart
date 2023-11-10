import 'package:flutter/material.dart';

class StudentList extends StatelessWidget {
  final List<Student> students;

  StudentList({required this.students});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return ListTile(
          title: Text(student.name),
          subtitle: Text('Grade: ${student.grade.toStringAsFixed(2)}, Attendance: ${student.attendance.toStringAsFixed(2)}%'),
        );
      },
    );
  }
}

class Student {
  final String name;
  final double grade;
  final double attendance;

  Student({required this.name, required this.grade, required this.attendance});
}
