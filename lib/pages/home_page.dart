import 'package:flutter/material.dart';
import 'aboutus_page.dart';
import 'cart_page.dart';
import 'store_page.dart';
import 'myaccount_page.dart';
import 'productview_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkMode = false; // State for light/dark mode

  final List<Map<String, String>> products = [
    {
      'name': 'Cadbury Dairy Milk',
      'image': 'lib/images/cadbury milk chocolate.jpeg',
    },
    {
      'name': 'Cadbury Dark Chocolate',
      'image': 'lib/images/cadbury oldgold dark chocolate.png',
    },
    {
      'name': 'Royal Dark Chocolate',
      'image': 'lib/images/cadbury royal dark chocolate.jpg',
    },
    {
      'name': 'Toblerone Fruit & Nut',
      'image': 'lib/images/toblerone fruit and nut.webp',
    },
    {
      'name': 'Feestables Milk Chocolate',
      'image': 'lib/images/mr beast milk chocolate.webp',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions and orientation
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return MaterialApp(
      theme: isDarkMode
          ? ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF77392C),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      )
          : ThemeData.light().copyWith(
        primaryColor: const Color(0xFF77392C),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF77392C),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'lib/images/logo.png',
                    height: 40, // Adjust height as necessary
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'BARS',
                    style: TextStyle(color: Color(0xFF77392C)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    isDarkMode ? 'Light' : 'Dark',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView( // Enable scrolling
          child: Column(
            children: [
              // Upper section with background image and overlay
              Container(
                height: screenSize.height * 0.4, 
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/images/Choc_1.png'), // Replace with your background image path
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.brown.withOpacity(0.5), // Brown overlay
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Indulge in the Finest Chocolates',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Poppins',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => StorePage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF77392C),
                              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: const Text(
                              'Shop Now',
                              style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Lower section with background based on the theme (white for light mode, black for dark mode)
              Container(
                color: isDarkMode ? Colors.black : Colors.white, // Set background color based on the mode
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Best Selling Products',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isLandscape ? 3 : 2, // 3 columns in landscape, 2 in portrait
                        childAspectRatio: 0.75, // Adjust aspect ratio to control card height/width
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: products.length,
                      shrinkWrap: true, // Wrap in a scrollable view
                      physics: const NeverScrollableScrollPhysics(), // Disable grid scrolling
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ProductViewPage()),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            elevation: 4,
                            color: isDarkMode ? Colors.grey[850] : Colors.white, // Card color based on the mode
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 1, // Make the image square
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.0),
                                      child: Image.asset(
                                        product['image']!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    product['name']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      color: isDarkMode ? Colors.white : Colors.black, // Text color based on the mode
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 4),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Floating action button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          },
          backgroundColor: const Color(0xFF77392C),
          child: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About Us'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'My Account'),
          ],
          currentIndex: 0,
          selectedItemColor: const Color(0xFF77392C),
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            if (index == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StorePage()));
            } else if (index == 2) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUsPage()));
            } else if (index == 3) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyAccountPage()));
            }
          },
        ),
      ),
    );
  }
}
