import 'package:flutter/material.dart';
import 'home_page.dart'; // Import HomePage for navigation after registration

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if the device is in landscape mode
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView( // Wrap the body in a SingleChildScrollView
        child: isLandscape
            ? Row(
          children: [
            // Left: Image Section
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: CircleAvatar(
                  radius: screenHeight * 0.2, // Adjust radius based on screen height
                  backgroundImage: AssetImage('lib/images/register_img.png'), // Replace with your image asset path
                ),
              ),
            ),
            // Right: Register Form Section
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Register Title
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: 30.0, // Adjusted for landscape
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: const Color(0xFF77392C),
                        ),
                      ),
                    ),

                    // Username Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // Email Field
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // Password Field
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),

                    // Register Button
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the HomePage when the button is pressed
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF77392C), // Darker brown color
                        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Register',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),

                    // Login link
                    GestureDetector(
                      onTap: () {
                        // Navigate back to the Login page
                        Navigator.pop(context); // Use pop to go back to the previous page
                      },
                      child: Text(
                        'Already have an account? Login',
                        style: TextStyle(
                          color: const Color(0xFF77392C),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
            : Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo or Image at the top
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0, top: 100.0),
                child: CircleAvatar(
                  radius: 75, // Radius for portrait
                  backgroundImage: AssetImage('lib/images/register_img.png'), // Replace with your image asset path
                ),
              ),

              // Register Title
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 20),
                child: Text(
                  'REGISTER',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: const Color(0xFF77392C),
                  ),
                ),
              ),

              // Username Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // Email Field
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // Password Field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),

              // Register Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to the HomePage when the button is pressed
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF77392C), // Darker brown color
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Register',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // Login link
              GestureDetector(
                onTap: () {
                  // Navigate back to the Login page
                  Navigator.pop(context); // Use pop to go back to the previous page
                },
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(
                    color: const Color(0xFF77392C),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
