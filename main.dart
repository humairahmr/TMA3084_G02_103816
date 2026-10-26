import 'dart:io';

void main() {
  bool ordering = true;
  int grandTotal = 0; // Tracks running total across multiple orders

  while (ordering) {
    // 1. Display prices
    print('\nPizza Price: Small: 5 USD, Medium: 7 USD, Large: 10 USD');

    // 2. Size input
    print('Please enter your pizza size (small, medium, or large):');
    String? sizeInput = stdin.readLineSync();
    String size = sizeInput?.trim().toLowerCase() ?? '';

    int price = 0;

    // 3. Switch statement to find unit price
    switch (size) {
      case 'small':
        price = 5;
        break;
      case 'medium':
        price = 7;
        break;
      case 'large':
        price = 10;
        break;
      default:
        print('Invalid pizza size. Please try again.');
        continue; // Restarts the loop without adding to grand total
    }

    // 4. Quantity input with validation
    int quantity = 0;
    while (quantity <= 0) {
      print('How many pizzas do you want of $size?');
      String? qtyInput = stdin.readLineSync();
      quantity = int.tryParse(qtyInput ?? '') ?? 0;

      if (quantity <= 0) {
        print('Please enter a valid positive quantity.');
      }
    }

    // 5. Calculate order total and update cumulative grand total
    int orderTotal = price * quantity;
    grandTotal += orderTotal;

    print('Order payment: $orderTotal USD');
    print('Current total payment: $grandTotal USD');

    // 6. Ask to continue or exit
    print('\nWould you like to order another pizza? (yes/no):');
    String? response = stdin.readLineSync()?.trim().toLowerCase();
    if (response != 'yes' && response != 'y') {
      ordering = false;
      print('----------------------------------------');
      print('Final total payment: $grandTotal USD');
      print('\nThank you for your order!');
    }
  }
}
