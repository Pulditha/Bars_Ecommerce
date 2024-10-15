import 'package:flutter/material.dart';
import 'package:chocolate_ecommerce/pages/home_page.dart';
import 'package:chocolate_ecommerce/pages/aboutus_page.dart';
import 'package:chocolate_ecommerce/pages/myaccount_page.dart';

// Define the Product class to store product details
class Product {
  final String name;
  final String imagePath;
  final double price;

  Product({required this.name, required this.imagePath, required this.price});
}

class StorePage extends StatelessWidget {
  StorePage({Key? key}) : super(key: key);


  final List<Product> products = [
    Product(name: 'Cadbury Dairy Milk', imagePath: 'lib/images/cadbury milk chocolate.jpeg', price: 150),
    Product(name: 'Cadbury Dark Chocolate', imagePath: 'lib/images/cadbury royal dark chocolate.jpg', price: 200),
    Product(name: 'Royal Dark Chocolate', imagePath: 'lib/images/cadbury oldgold dark chocolate.png', price: 250),
    Product(name: 'Toblerone Fruit & Nut', imagePath: 'lib/images/toblerone fruit and nut.webp', price: 300),
    Product(name: 'Feestables Milk Chocolate', imagePath: 'lib/images/mr beast milk chocolate.webp', price: 180),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'lib/images/logo.png',
              height: 40,
            ),
            const SizedBox(width: 8),
            const Text(
              'BARS',
              style: TextStyle(color: Color(0xFF77392C)),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section
            Container(
              color: const Color(0xFF77392C),
              padding: const EdgeInsets.all(20.0),
              width: double.infinity,
              height: 200,
              child: Column(
                children: const [
                  Text(
                    'Store',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Browse your favorite picks',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Search Bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for products...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF77392C), // Brown color for the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'Search',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),


            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Best Selling Products',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF77392C),
                ),
              ),
            ),
            const SizedBox(height: 10),


            _buildProductGrid(),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: const Color(0xFF77392C),
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About Us',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'My Account',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: const Color(0xFF77392C),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AboutUsPage()),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyAccountPage()),
            );
          }
        },
      ),
    );
  }


  Widget _buildProductCard(BuildContext context, Product product) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF77392C),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'RS ${product.price}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        childAspectRatio: 0.6, // Aspect ratio for cards
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemCount: products.length, // Total number of products
      itemBuilder: (context, index) {
        return _buildProductCard(context, products[index]);
      },
    );
  }
}
