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
        backgroundColor: Colors.white, // White AppBar
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Column(
                  children: [
                    // Circular User Image
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('lib/images/login_img.png'),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Welcome Pulditha!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Pulditha@gmail.com',
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

                },
              ),
              ListTile(
                title: const Text('Payment Methods'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {

                },
              ),
              ListTile(
                title: const Text('Order History'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {

                },
              ),
              ListTile(
                title: const Text('Logout'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {

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
        currentIndex: 3,
        selectedItemColor: const Color(0xFF77392C),
        unselectedItemColor: Colors.grey,
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
