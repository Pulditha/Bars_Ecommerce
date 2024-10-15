import 'package:flutter/material.dart';
import 'package:chocolate_ecommerce/pages/home_page.dart';
import 'package:chocolate_ecommerce/pages/store_page.dart';
import 'package:chocolate_ecommerce/pages/myaccount_page.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();


    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'lib/images/logo.png', // Path to the logo image
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
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

                Stack(
                  children: [
                    Image.asset(
                      'lib/images/choc_coverimg1.png',
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      height: 250,
                      color: Colors.brown.withOpacity(0.7), // Brown overlay
                    ),
                    Positioned(
                      top: 100,
                      left: 20,
                      child: const Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 20),


              _buildSectionWithIcon(
                title: 'Mission',
                content: 'Our mission is to create happiness with every bite.',
                icon: Icons.emoji_emotions, // Icon representing mission
              ),

              _buildSectionWithIcon(
                title: 'Our Values',
                content: 'Quality, Integrity, and Customer Satisfaction are at the heart of our operations.',
                icon: Icons.thumb_up, // Icon representing values
              ),

              _buildSectionWithIcon(
                title: 'Our History',
                content: 'Founded in 2020, we have quickly established ourselves as a beloved chocolate brand known for innovation and quality.',
                icon: Icons.history, // Icon representing history
              ),

              _buildExpansionTileSection(
                title: 'Contact Us',
                content: 'For inquiries, please reach us at support@chocolatebars.com.',
                icon: Icons.contact_mail, // Icon representing contact
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
        currentIndex: 2,
        selectedItemColor: const Color(0xFF77392C),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  StorePage()),
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


  Widget _buildSectionWithIcon({required String title, required String content, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40,
                color: const Color(0xFF77392C),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF77392C),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      content,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildExpansionTileSection({required String title, required String content, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ExpansionTile(
          leading: Icon(
            icon,
            size: 40,
            color: const Color(0xFF77392C),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF77392C),
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                content,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
