import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartWidget extends StatelessWidget {
  final List<Student> students;

  ChartWidget({required this.students});

  @override
  Widget build(BuildContext context) {
    // Create data series for the chart
    List<charts.Series<Student, String>> data = [
      charts.Series<Student, String>(
        id: 'StudentData',
        domainFn: (Student student, _) => student.name,
        measureFn: (Student student, _) => student.grade,
        data: students,
      ),
    ];

    return charts.BarChart(
      data,
      animate: true,
    );
  }
}

class Student {
  final String name;
  final double grade;

  Student({required this.name, required this.grade});
}
