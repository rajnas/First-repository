class Student {
  int? id;
  String name;
  double grade;
  double attendance;

  Student({
    this.id,
    required this.name,
    required this.grade,
    required this.attendance,
  });

  // Convert a Student object to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id, // Include the id if you have one
      'name': name,
      'grade': grade,
      'attendance': attendance,
    };
  }

  // Create a Student object from a Map
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      grade: map['grade'],
      attendance: map['attendance'],
    );
  }
}
