int totalCalls = 0;
void greet() {
  totalCalls++;
  print("Hello! Welcome to Dart programming!");
}

void main() {
  greet();
  greet();
  greet();

  introduce('Alex', 25);
  introduce('Kanat', 45);
  introduce('Meerim', 34);

  int result = addNumbers(5, 8);
  print('Sum of 5 and 8 is $result.');

  double result1 = calculateDiscount(price: 100);
  print('Final price: $result1');
  double result2 = calculateDiscount(price: 100, discount: 10);
  print('Final price: $result2');

  double result3 = calculateDiscount(price: 100, discount: 10, tax: 12);
  print('Final price: $result3');
  print('Total function calls: $totalCalls');
}

void introduce(String name, int age) {
  totalCalls++;
  print('My name is $name and I am $age years old');
}

int addNumbers(int a, int b) {
  totalCalls++;
  return a + b;
}

double calculateDiscount({
  required double price,
  double discount = 0,
  double tax = 0,
}) {
  totalCalls++;

  double finalPrice = price - (price * discount / 100) + (price * tax / 100);
  return finalPrice;
}
