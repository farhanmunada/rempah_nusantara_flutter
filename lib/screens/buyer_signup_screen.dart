
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuyerSignupScreen extends StatelessWidget {
  const BuyerSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF9F4),
      appBar: AppBar(
        title: const Text(
          'Sign Up Buyer',
          style: TextStyle(
            color: Color(0xFF4A4A4A),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFFBF9F4),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4A4A4A)),
          onPressed: () => context.go('/login'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                _buildTextField(label: 'Full Name', hint: 'John Doe'),
                const SizedBox(height: 20),
                _buildTextField(label: 'Email', hint: 'example@example.com'),
                const SizedBox(height: 20),
                _buildTextField(label: 'Mobile Number', hint: '+123 456 789'),
                const SizedBox(height: 20),
                _buildTextField(label: 'Date Of Birth', hint: 'DD / MM / YYY'),
                const SizedBox(height: 20),
                _buildTextField(
                    label: 'Password', hint: '••••••••', isPassword: true),
                const SizedBox(height: 20),
                _buildTextField(
                    label: 'Confirm Password',
                    hint: '••••••••',
                    isPassword: true),
                const SizedBox(height: 30),
                const Text(
                  'By continuing, you agree to\nTerms of Use and Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Logic for sign up will be added later
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4D5D42),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.black54),
                    ),
                    TextButton(
                      onPressed: () => context.go('/login'),
                      child: const Text(
                        'Log In',
                        style: TextStyle(
                          color: Color(0xFF4D5D42),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label,
      required String hint,
      bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF4A4A4A),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xFF4D5D42),
            hintStyle: const TextStyle(color: Colors.white54),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: isPassword
                ? const Icon(
                    Icons.visibility_off,
                    color: Colors.white54,
                  )
                : null,
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
