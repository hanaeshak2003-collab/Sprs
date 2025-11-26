import 'package:flutter/material.dart';
import 'Cart Screen.dart';
import 'Checkout Screen.dart';

class FoodItem {
  final String id;
  final String name;
  final int price;
  final String category;


  FoodItem({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _searchQuery = '';

  // ==================== MENU ====================
  final List<FoodItem> restaurantItems = [
    // PIZZA
    FoodItem(id: 'p1', name: 'Pepperoni', price: 190, category: 'Pizza'),
    FoodItem(id: 'p2', name: 'Margherita', price: 130, category: 'Pizza'),
    FoodItem(id: 'p3', name: 'Chicken Ranch', price: 200, category: 'Pizza'),
    FoodItem(id: 'p4', name: 'Quattro Formaggi', price: 185, category: 'Pizza'),
    FoodItem(id: 'p5', name: 'Chicken Barbecue', price: 200, category: 'Pizza'),
    FoodItem(id: 'p6', name: 'Watercress', price: 180, category: 'Pizza'),
    FoodItem(id: 'p7', name: 'Funghi (Mushroom)', price: 150, category: 'Pizza'),
    FoodItem(id: 'p8', name: 'Shrimp', price: 250, category: 'Pizza'),
    FoodItem(id: 'p9', name: 'Saver', price: 200, category: 'Pizza'),
    FoodItem(id: 'p10', name: 'Hawaiian', price: 195, category: 'Pizza'),
    FoodItem(id: 'p11', name: 'Vegan', price: 170, category: 'Pizza'),
    FoodItem(id: 'p12', name: 'Potato', price: 170, category: 'Pizza'),

    // MAIN COURSE
    FoodItem(id: 'm1', name: 'Grilled Chicken', price: 240, category: 'Main Course'),
    FoodItem(id: 'm2', name: 'Chicken Berry', price: 260, category: 'Main Course'),
    FoodItem(id: 'm3', name: 'Chicken Olive Lover', price: 250, category: 'Main Course'),
    FoodItem(id: 'm4', name: 'Beef Stroganoff', price: 340, category: 'Main Course'),

    // PASTA
    FoodItem(id: 'pa1', name: 'Alfredo', price: 170, category: 'Pasta'),
    FoodItem(id: 'pa2', name: 'Arrabiata', price: 100, category: 'Pasta'),
    FoodItem(id: 'pa3', name: 'Norcina', price: 200, category: 'Pasta'),
    FoodItem(id: 'pa4', name: 'Salmon', price: 210, category: 'Pasta'),
    FoodItem(id: 'pa5', name: 'Fruit di Mare (Seafood)', price: 230, category: 'Pasta'),
    FoodItem(id: 'pa6', name: 'Vegetables', price: 140, category: 'Pasta'),

    // BURGER
    FoodItem(id: 'b1', name: 'Classic Burger (Single)', price: 130, category: 'Burger'),
    FoodItem(id: 'b2', name: 'Classic Burger (Double)', price: 205, category: 'Burger'),
    FoodItem(id: 'b3', name: 'Beef Bacon Burger (Single)', price: 160, category: 'Burger'),
    FoodItem(id: 'b4', name: 'Beef Bacon Burger (Double)', price: 235, category: 'Burger'),
    FoodItem(id: 'b5', name: 'Mix Cheese Burger (Single)', price: 175, category: 'Burger'),
    FoodItem(id: 'b6', name: 'Mix Cheese Burger (Double)', price: 250, category: 'Burger'),
    FoodItem(id: 'b7', name: 'Mushroom Burger (Single)', price: 155, category: 'Burger'),
    FoodItem(id: 'b8', name: 'Mushroom Burger (Double)', price: 230, category: 'Burger'),
    FoodItem(id: 'b9', name: 'Smash Burger (Single)', price: 130, category: 'Burger'),
    FoodItem(id: 'b10', name: 'Smash Burger (Double)', price: 205, category: 'Burger'),

    // SALADS
    FoodItem(id: 's1', name: 'Rocca Salad', price: 80, category: 'Salads'),
    FoodItem(id: 's2', name: 'SPRS Salad', price: 100, category: 'Salads'),

    // EXTRAS
    FoodItem(id: 'e1', name: 'Fries', price: 35, category: 'Extras'),
    FoodItem(id: 'e2', name: 'Cheese', price: 30, category: 'Extras'),
    FoodItem(id: 'e3', name: 'BBQ Sauce', price: 20, category: 'Extras'),
    FoodItem(id: 'e4', name: 'Ranch Sauce', price: 20, category: 'Extras'),
    FoodItem(id: 'e5', name: 'Freskas', price: 40, category: 'Extras'),
    FoodItem(id: 'e6', name: 'Onion Rings', price: 40, category: 'Extras'),
    FoodItem(id: 'e7', name: 'Mozzarella Sticks', price: 50, category: 'Extras'),
  ];

  late List<FoodItem> filteredItems;

  @override
  void initState() {
    super.initState();
    filteredItems = restaurantItems;
  }

  void _filterItems(String query) {
    setState(() {
      _searchQuery = query;
      filteredItems = restaurantItems
          .where((item) =>
      item.name.toLowerCase().contains(query.toLowerCase()) ||
          item.category.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CartScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CheckoutScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          "SPRS",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: _filterItems,
              decoration: InputDecoration(
                hintText: 'Search items...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                  const BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 6,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        margin: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.fastfood,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.category,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${item.price} EGP',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${item.name} added to cart!'),
                                backgroundColor: Colors.grey,
                                duration: const Duration(seconds: 2),
                              ),
                            );
                          },
                          child: const Text(
                            "Add",
                            style:
                            TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view), label: 'Menu'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.payment), label: 'Checkout'),
        ],
      ),
    );
  }
}
