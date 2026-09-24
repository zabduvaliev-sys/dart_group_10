import 'dart:io';

void main() {
  print('What is your age?');
  int age = int.parse(stdin.readLineSync()!);

  print('What is the temperature?');
  int temperature = int.parse(stdin.readLineSync()!);

  if (age > 45 && temperature >= -10 && temperature <= 25) {
    print('You can go for a walk');
  } else if (age >= 20 &&
      age <= 45 &&
      temperature >= -20 &&
      temperature <= 30) {
    print('You can go for a walk');
  } else if (age < 20 && temperature >= 0 && temperature <= 28) {
    print('You can go for a walk');
  } else {
    print('Stay home');
  }

  print('What is the day today?');
  String day = stdin.readLineSync()!.toLowerCase();
  switch (day) {
    case 'monday':
      print("It's the start of the week!");
    case 'tuesday':
      print("Keep going, almost weekend!");
    case 'wednesday':
      print("Keep going, almost weekend!");
    case 'thursday':
      print("Keep going, almost weekend!");
    case 'friday':
      print("Weekend is coming!");
    case 'saturday' || 'Sunday':
      print("Enjoy your weekend!");
    default:
      print('Invalid day');
  }
  print('Enter password');
  String password = stdin.readLineSync()!;
  if(password.isEmpty){
    print('Password cannot be empty.');
    } else if (password.length < 6) {
      print('Password too short.');
    } else { if (password == 'dart123') {
      print('Access granted.');
     } else { print('Wrong password');
    }
  }
}
