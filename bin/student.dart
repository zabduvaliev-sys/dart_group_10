import 'person.dart';
import 'subjects.dart';

class Student extends Person {
  Map<Subject, double> marks;

  Student(
    String fullName,
    int age,
    bool isMarried,
    this.marks,
  ) : super(fullName, age, isMarried);

  void showMarks() {
    print('Student: $fullName');

    for (var entry in marks.entries) {
      print('${entry.key}: ${entry.value}');
    }
  }

  double calculateAverage() {
    double sum = 0;

    for (var mark in marks.values) {
      sum += mark;
    }

    return sum / marks.length;
  }

  @override
  void introduce() {
    super.introduce();
    print('Average mark: ${calculateAverage()}');
  }
}