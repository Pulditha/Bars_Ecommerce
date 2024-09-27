import 'package:chocolate_ecommerce/pages/aboutus_page.dart';
import 'package:chocolate_ecommerce/pages/store_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class MyAccountPage extends StatelessWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'lib/images/logo.png', // Replace with your logo path
              height: 40, // Adjust height as necessary
            ),
            const SizedBox(width: 8),
            const Text(
              'BARS',
              style: TextStyle(color: Color(0xFF77392C)), // Brown color for the text
            ),
          ],
        ),
        backgroundColor: Colors.white, // White AppBar
        elevation: 0, // No shadow for the AppBar
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Profile Section
              Center(
                child: Column(
                  children: [
                    // Circular User Image
                    CircleAvatar(
                      radius: 50, // Adjust radius as necessary
                      backgroundImage: AssetImage('lib/images/login_img.png'), // Placeholder image
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Welcome Pulditha!', // Placeholder username
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Pulditha@gmail.com', // Placeholder email
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Account Settings Section
              const Text(
                'Account Settings',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Update your preferences and manage your account settings here.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              // Settings Options
              ListTile(
                title: const Text('Change Password'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Implement change password functionality
                },
              ),
              ListTile(
                title: const Text('Payment Methods'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Implement payment methods functionality
                },
              ),
              ListTile(
                title: const Text('Order History'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Implement order history functionality
                },
              ),
              ListTile(
                title: const Text('Logout'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Implement logout functionality
                },
              ),
            ],
          ),
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
        currentIndex: 3, // Set 'My Account' as the active page
        selectedItemColor: const Color(0xFF77392C), // Brown selected icon color
        unselectedItemColor: Colors.grey, // Grey for unselected items
    onTap: (index) {
    if (index == 0) {
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const HomePage()), // Navigate to HomePage
    );
    } else if (index == 1) {
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) =>  StorePage()), // Navigate to StorePage
    );
    } else if (index == 2) {
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const AboutUsPage()), // Navigate to MyAccountPage
    );
    }
        }
      ),
    );
  }
}
