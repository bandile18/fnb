void main() {
  int myInt = 42;
  double myDouble = 3.14;
  String myString = 'hello';
  bool myBool = true;
  List<int> myList = [1, 2, 3, 4, 5];
  
  print('int: $myInt');
  print('double: $myDouble');
  print('String: $myString');
  print('bool: $myBool');
  print('List<int>: $myList');

  
  int stringToInt(String s) => int.parse(s);
  double stringToDouble(String s) => double.parse(s);
  String intToString(int v) => v.toString();
  double intToDouble(int v) => v.toDouble();


  void convertAndDisplay(String number) {
    try {
      int asInt = stringToInt(number);
      double asDouble = stringToDouble(number);
      print('convertAndDisplay -> int: $asInt, double: $asDouble');
    } catch (e) {
      print('convertAndDisplay -> invalid input: $number');
    }
  }

  convertAndDisplay('123');
  convertAndDisplay('3.5'); 


  int checkNum = -5;
  if (checkNum > 0) {
    print('$checkNum is positive');
  } else if (checkNum < 0) {
    print('$checkNum is negative');
  } else {
    print('$checkNum is zero');
  }

  int age = 18;
  if (age >= 18) {
    print('you can vote');
  } else {
    print('you are too young to vote');
  }

  int day = 3;
  switch (day) {
    case 1:
      print('Monday');
      break;
    case 2:
      print('Tuesday');
      break;
    case 3:
      print('Wednesday');
      break;
    case 4:
      print('Thursday');
      break;
    case 5:
      print('Friday');
      break;
    case 6:
      print('Saturday');
      break;
    case 7:
      print('Sunday');
      break;
    default:
      print('Invalid day: $day');
  }


  for (var i = 1; i <= 10; i++) {
    print('for: $i');
  
  var w = 10;
  }
  while (w >= 1) {
    print('while: $w');
    w--;
  }


  var d = 1;
  do {
    print('do-while: $d');
    d++;
  } while (d <= 5);

  for (var n in myList) {
    print('number: $n');

    if (n % 2 == 0) {
      print('  even');
    } else {
      print('  odd');
    }

    int category = (n >= 1 && n <= 10) ? 1 : (n <= 100 ? 2 : 3);
    switch (category) {
      case 1:
        print('  category: small (1-10)');
        break;
      case 2:
        print('  category: medium (11-100)');
        break;
      case 3:
        print('  category: large (101+)');
        break;
    }
  }
}
