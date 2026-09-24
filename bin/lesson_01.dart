void main() {
  String myName = 'Zarylbek';
  String myCity = 'Bishkek';
  String myJob = 'auditor';
  String myHobby = 'reading';
  int myAge = 43;
  print('hello! My name is ' + myName);
  print('I am $myAge years old and I live in $myCity');
  print('My profession is $myJob.');
  print('In my free time, I enjoy $myHobby');
  int salary = 1000;
  print('My yearly income: ${salary * 12}');
  print('My yearly income with 10% bonus: ${salary * 1.1 * 12}');
  String sampleString = ' Knowledge is power, but practice makes perfect. ';
  print(sampleString);
print(sampleString.trim());
print(sampleString.toUpperCase());
print(sampleString.replaceAll('practice', 'experience'));
print(sampleString.contains('power'));
int apples = 12;
int people = 5;
print('Each person gets ${apples~/people} apples');
print('Apples left ${apples % people}');
int currentYear = 2026;
print('I was born in ${currentYear - myAge}');
var city = 'Bishkek';// var - автоматически дает правильную команду для присваивания переменной,final - закрепляет переменную 
final String country = 'Kyrgyzstan';
city = 'Osh';
print('City: $city');
print('Country: $country');
}
