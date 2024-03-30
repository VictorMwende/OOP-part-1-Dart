// Interface for printable objects
abstract class Printable {
  void printDetails();
}

// Base class for items
class Item {
  String name;
  double price;

  Item(this.name, this.price);

  // Overridden in subclasses to provide specific details
  void printDetails() {
    print("Name: $name, Price: \$$price");
  }
}

// Subclass of Item that implements Printable
class Book extends Item implements Printable {
  String author;

  Book(String name, double price, this.author) : super(name, price);

  @override // Override the inherited printDetails method
  void printDetails() {
    super.printDetails(); // Call parent class printDetails
    print("Author: $author");
  }
}

// Function to read data from a file (replace with your actual file reading logic)
List<String> readDataFromFile(String filename) {
  // Simulate reading data from a file
  return [
    "Shirt,19.99",
    "Novel,14.50,Author1", // Example data with author for Book
  ];
}

void main() {
  // Read data from a file
  List<String> itemData = readDataFromFile("items.txt");

  // Create items based on data
  List<Item> items = [];
  for (var itemString in itemData) {
    List<String> itemDetails = itemString.split(",");
    if (itemDetails.length == 2) {
      items.add(Item(itemDetails[0], double.parse(itemDetails[1])));
    } else if (itemDetails.length == 3) {
      items.add(
          Book(itemDetails[0], double.parse(itemDetails[1]), itemDetails[2]));
    } else {
      print("Error: Invalid data format in file");
    }
  }

  // Print details of each item
  for (var item in items) {
    if (item is Printable) {
      // Check if item implements Printable
      item.printDetails();
      print("---");
    } else {
      print("This item cannot be printed");
    }
  }
}
