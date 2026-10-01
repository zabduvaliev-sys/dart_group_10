enum Subject { math, physics, english, history }

class Person {
  String fullName;
  int age;
  bool isMarried;

  Person(this.fullName, this.age, this.isMarried);

  void introduce() {
    print(
      'Hi! My name is $fullName. I am $age years old. Married: ${isMarried ? 'Yes' : 'No'}.',
    );
  }
}

class Student extends Person {
  Map<Subject, double> marks;

  Student(String fullName, int age, bool isMarried, this.marks)
    : super(fullName, age, isMarried);

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
    print(
      'Hi! My name is $fullName. I am $age years old. Married: ${isMarried ? 'Yes' : 'No'}.',
    );
    print('Average mark: ${calculateAverage()}');
  }
}

class Teacher extends Person {
  int experience;

  static double _baseSalary = 50000;

  Teacher(String fullName, int age, bool isMarried, this.experience)
    : super(fullName, age, isMarried);

  double calculateSalary() {
    double salary = _baseSalary;

    if (experience > 3) {
      for (int year = 4; year <= experience; year++) {
        salary = salary * 1.05;
      }
    }
    if (isMarried) {
      salary = salary + 5000;
    }

    return salary;
  }

  @override
  void introduce() {
    print(
      'Hi! My name is $fullName. '
      'I am $age years old. '
      'Married: ${isMarried ? 'Yes' : 'No'}.',
    );

    print('Experience: $experience years.');
    print('Salary: ${calculateSalary().toStringAsFixed(1)}');
  }
}

void main() {
  Person person1 = Person('Alice Johnson', 30, true);

  person1.introduce();
  Student student1 = Student('Adam White', 17, false, {
    Subject.math: 90,
    Subject.physics: 85,
    Subject.english: 92,
  });

  student1.showMarks();

  print('Average mark: ${student1.calculateAverage()}');

  student1.introduce();
  Student student2 = Student('Sarah Smith', 18, false, {
    Subject.math: 95,
    Subject.physics: 91,
    Subject.english: 90,
  });

  student2.showMarks();

  print('Average mark: ${student2.calculateAverage()}');

  student2.introduce();

  Teacher teacher = Teacher('John Brown', 40, true, 10);

  teacher.introduce();
}
