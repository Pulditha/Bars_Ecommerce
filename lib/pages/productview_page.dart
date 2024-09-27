import 'package:flutter/material.dart';

class ProductViewPage extends StatelessWidget {
  const ProductViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // White AppBar
        iconTheme: const IconThemeData(color: Color(0xFF77392C)), // Set icon color
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'lib/images/logo.png', // Replace with your logo path
                  height: 40, // Adjust height as necessary
                ),
                const SizedBox(width: 8),
                const Text(
                  'BARS',
                  style: TextStyle(
                    color: Color(0xFF77392C), // Brown color for the text
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          double imageHeight = constraints.maxWidth > 600 ? 350 : 250; // Adjust image height for larger screens
          double padding = constraints.maxWidth > 600 ? 24.0 : 16.0;

          return SingleChildScrollView(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Breadcrumb navigation
                const Text(
                  'Home > Store > Milk Chocolate > Cadbury Dairy Milk',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 10),

                // Product Image
                Image.asset(
                  'lib/images/cadbury milk chocolate.jpeg',
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),

                // Product Title
                const Text(
                  'Cadbury Dairy Milk',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 10),

                // Product Price
                const Text(
                  'RS 150',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                // Product Description
                const Text(
                  'A classic chocolate bar made with smooth and creamy milk chocolate. Perfect for a sweet treat any time of the day!',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                // Ingredients
                const Text(
                  'Ingredients:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Milk, Sugar, Cocoa Butter, Chocolate, Emulsifiers (Soy Lecithin), Artificial Flavors, and Salt.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                // Add to Cart Button
                ElevatedButton(
                  onPressed: () {
                    // Add functionality to add product to cart
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF77392C),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        },
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
        currentIndex: 1, // Adjust this based on the active page
        selectedItemColor: const Color(0xFF77392C), // Brown selected icon color
        unselectedItemColor: Colors.grey, // Grey for unselected items
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/home'); // Navigate to HomePage
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/store'); // Navigate to StorePage
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/about'); // Navigate to AboutUsPage
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/account'); // Navigate to MyAccountPage
          }
        },
      ),

      // Floating Action Button for Cart
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart'); // Navigate to CartPage
        },
        backgroundColor: const Color(0xFF77392C), // Brown color
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.white, // White icon regardless of the theme
        ),
      ),
    );
  }
}
