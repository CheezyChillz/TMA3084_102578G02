import 'dart:io';

void main() {
  // Display prices
  print('=== Pizza Order Calculator ===');
  print('Prices:');
  print('Small  = \$5 USD');
  print('Medium = \$7 USD');
  print('Large  = \$10 USD');
  print('==============================\n');

  bool keepOrdering = true;

  // Continuous ordering
  while (keepOrdering) {
    stdout.write('Enter pizza size (Small, Medium, Large) or "exit" to quit: ');
    String? sizeInput = stdin.readLineSync()?.trim();

    if (sizeInput == null || sizeInput.isEmpty) {
      print('Invalid input. Please try again.\n');
      continue;
    }

    if (sizeInput.toLowerCase() == 'exit') {
      print('Thank you for using the Pizza Order Calculator. Goodbye!');
      break;
    }

    int pricePerPizza = 0;
    bool validSize = true;

    // Determine price per pizza based on size
    switch (sizeInput.toLowerCase()) {
      case 'small':
        pricePerPizza = 5;
        break;
      case 'medium':
        pricePerPizza = 7;
        break;
      case 'large':
        pricePerPizza = 10;
        break;
      default:
        print('Invalid size selected! Please choose Small, Medium, or Large.\n');
        validSize = false;
    }

    if (!validSize) {
      continue;
    }

    // Ask for quantity
    int? quantity;
    while (quantity == null || quantity <= 0) {
      stdout.write('Enter quantity: ');
      String? qtyInput = stdin.readLineSync()?.trim();
      quantity = int.tryParse(qtyInput ?? '');

      if (quantity == null || quantity <= 0) {
        print('Please enter a valid positive integer for quantity.');
      }
    }

    // Calculate total payment
    int totalPayment = pricePerPizza * quantity;

    print('\n------------------------------');
    print('Order Summary:');
    print('Size: ${sizeInput[0].toUpperCase()}${sizeInput.substring(1).toLowerCase()}');
    print('Quantity: $quantity');
    print('Total Payment: \$$totalPayment USD');
    print('------------------------------\n');

    // Ask if user wants to place another order
    stdout.write('Would you like to place another order? (yes/no): ');
    String? continueInput = stdin.readLineSync()?.trim().toLowerCase();
    if (continueInput != 'yes' && continueInput != 'y') {
      keepOrdering = false;
      print('Thank you for your order! Have a great day.');
    }
    print('');
  }
}