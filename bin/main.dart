import 'person.dart';
import 'student.dart';
import 'teacher.dart';
import 'subjects.dart';

void main() {
  Person person1 = Person('Alice Johnson', 30, true);
  person1.introduce();

  print('');

  Student student1 = Student('Adam White', 17, false, {
    Subject.math: 90,
    Subject.physics: 85,
    Subject.english: 92,
  });

  student1.showMarks();
  print('Average mark: ${student1.calculateAverage()}');
  student1.introduce();

  print('');

  Student student2 = Student('Sarah Smith', 18, false, {
    Subject.math: 95,
    Subject.physics: 91,
    Subject.english: 90,
  });

  student2.showMarks();
  print('Average mark: ${student2.calculateAverage()}');
  student2.introduce();

  print('');

  Teacher teacher = Teacher('John Brown', 40, true, 10);

  teacher.introduce();
}
