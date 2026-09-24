void main () {
    for (int i=1; i <= 30; i++) {
        if (i % 3 == 0 && i % 5 == 0) {
            print('FizzBuzz');
        } else if(i % 3 == 0) {
            print ('Fizz');
        }else if(i % 5 == 0) {
            print('Buzz');
        }else{
            print(i);
        }
    }
    List<int> numbers = [3, -2, 0, 7, -5, 10, 1];
    int sum = 0;
int count = 0;
int i = 0;
while (i<numbers.length) {
    if (numbers[i] >0) {
        sum+= numbers[i];
        count++;
    }
    i++;
}
if (count > 0) {
    double average = sum/ count;
    print ('positive numbers count: $count');
    print ('average of positive numbers: $average');
} else {
    print('No positive numbers.');
}
Map<String, int> fruits = {'Apple':5, 'Banana':2, 'Mango':7, 'Orange':0};
fruits.forEach((key, value) {
    if(value>0) {
        print('Available: $key ($value pcs)');
    }
});
}