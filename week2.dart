import 'dart:math';

class Item {
  final String name;
  final double price;
  Item(this.name, this.price);
  Item copyWith({double? price}) => Item(name, price ?? this.price);
  @override
  String toString() => '$name: \$${price.toStringAsFixed(2)}';
}

int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

 `percent` 
double Function(double) makeDiscount(double percent) {
  return (double price) => price * (1 - percent / 100);
}


double computeTotal(List<Item> items, {double taxPercent = 0.0}) {
  final subtotal = items.fold<double>(0.0, (s, it) => s + it.price);
  final tax = subtotal * (taxPercent / 100);
  return subtotal + tax;
}

void main() {
  
  final cart = <Item>[
    Item('Notebook', 9.50),
    Item('Headphones', 29.99),
    Item('Coffee Mug', 12.00),
    Item('USB Cable', 8.00),
    Item('Keyboard', 45.00),
  ];

  print('Initial cart:');
  cart.forEach(print);

  
  final filtered = cart.where((item) => item.price >= 10).toList();
  print('\nAfter filtering (>= \$10):');
  filtered.forEach(print);

  
  final baseDiscountPercent = 10.0; 
  final discountMapper = makeDiscount(baseDiscountPercent);
  final discounted = filtered
      .map((it) => it.copyWith(price: discountMapper(it.price)))
      .toList();
  print('\nAfter applying base discount (${baseDiscountPercent.toStringAsFixed(0)}%):');
  discounted.forEach(print);
  final itemCount = discounted.length;
  final fact = factorial(itemCount);
  
  final extraDiscountPercent = min(fact.toDouble(), 20.0);
  final extraMapper = makeDiscount(extraDiscountPercent);
  final afterFactorialDiscount = discounted
      .map((it) => it.copyWith(price: extraMapper(it.price)))
      .toList();
  print('\nApplying extra factorial discount (${extraDiscountPercent.toStringAsFixed(0)}% based on factorial($itemCount)=$fact):');
  afterFactorialDiscount.forEach(print);


  final taxPercent = 8.0; 
  final subtotal = afterFactorialDiscount.fold<double>(0.0, (s, it) => s + it.price);
  final total = computeTotal(afterFactorialDiscount, taxPercent: taxPercent);
  print('\nSubtotal: \$${subtotal.toStringAsFixed(2)}');
  print('Tax (${taxPercent.toStringAsFixed(1)}%): \$${(subtotal * taxPercent / 100).toStringAsFixed(2)}');
  print('Final total: \$${total.toStringAsFixed(2)}');
}