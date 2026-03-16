import 'package:flutter/material.dart';

import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // Controllers allow us to read the text typed into the input fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  // Function that runs when the login button is pressed
  void loginUser() {

    // Read the values typed by the user
    String email = emailController.text;
    String password = passwordController.text;

    // Simple validation
    if(email.isEmpty || password.isEmpty)
    {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter email and password"),
        ),
      );
      return;
    }

    // TODO: REMEMBER TO REMOVE THIS PRINT STATEMENT LATER
    // For now we just print the values
    // Later this is where your API or Firebase login will happen
    print("Email: $email");
    print("Password: $password");

    // Show login success message
    ScaffoldMessenger.of(context  ).showSnackBar(
      const SnackBar(
        content: Text("Login successful"),
        duration: Duration(seconds: 2),
      ),
    );

    // Wait for the snackbar to finish showing before navigating
    Future.delayed(const Duration(seconds: 2), () {

      Navigator.pushReplacement(context,MaterialPageRoute(
        builder: (context) => const HomeScreenPage(),
        ),
      );

    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // Dark theme background
      backgroundColor: const Color(0xFF0F0B1F),

      body: Stack(

  children: [

    // BACKGROUND IMAGE
    Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/login_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
    ),

    // DARK OVERLAY (makes text easier to read)
    Container(
      color: Colors.black.withOpacity(0.35),
    ),

    // MAIN CONTENT
    SafeArea(

      child: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: Column(
            children: [

              const SizedBox(height: 40),

              // Logo Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset(
                    "assets/images/vibely_icon.jpg",
                    height: 28,
                  ),

                  const SizedBox(width: 8),

                  const Text(
                    "VIBELY",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 40),

              const Text(
                "Welcome to Vibely! 👋",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Connect with new friends and have fun",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 40),

                // Email Field
                TextField(

                  controller: emailController,

                  style: const TextStyle(color: Colors.white),

                  decoration: InputDecoration(

                    hintText: "Email or Phone Number",
                    hintStyle: const TextStyle(color: Colors.white54),

                    filled: true,
                    fillColor: const Color(0xFF1B1534),

                    prefixIcon: const Icon(Icons.email,color: Colors.white54),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Password Field
                TextField(

                  controller: passwordController,

                  obscureText: true,

                  style: const TextStyle(color: Colors.white),

                  decoration: InputDecoration(

                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.white54),

                    filled: true,
                    fillColor: const Color(0xFF1B1534),

                    prefixIcon: const Icon(Icons.lock,color: Colors.white54),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // LOGIN BUTTON
                GestureDetector(

                  onTap: loginUser,

                  child: Container(

                    width: double.infinity,
                    height: 55,

                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(30),

                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF6A3BFF),
                          Color(0xFFFF4D8D),
                        ],
                      ),
                    ),

                    child: const Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "OR",
                  style: TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 25),

                // Social Login Buttons
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    socialButton(Icons.facebook),
                    socialButton(Icons.g_mobiledata),
                    socialButton(Icons.apple),
                    socialButton(Icons.phone_android),

                  ],
                ),

                const SizedBox(height: 40),

                const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 10),

                // SIGN UP BUTTON
                Container(

                  width: double.infinity,
                  height: 55,

                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(30),

                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF6A3BFF),
                        Color(0xFFFF4D8D),
                      ],
                    ),
                  ),

                  child: const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Privacy Policy  •  Terms of Service",
                  style: TextStyle(color: Colors.white54,fontSize: 12),
                ),

                const SizedBox(height: 40),

              ],
            ),
          ),
        ),
      ),
    ],//children
        ),//stack
    );//scaffold
  }

  // Reusable social login button widget
  Widget socialButton(IconData icon)
  {
    return Container(

      height: 55,
      width: 55,

      decoration: BoxDecoration(
        color: const Color(0xFF1B1534),
        borderRadius: BorderRadius.circular(14),
      ),

      child: Icon(icon,color: Colors.white),
    );
  }

}
