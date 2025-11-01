
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BuyerLoginScreen extends StatelessWidget {
  const BuyerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF9F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A4A4A),
                ),
              ),
              const SizedBox(height: 60),
              _buildTextField(label: 'Email', hint: 'example@example.com'),
              const SizedBox(height: 20),
              _buildTextField(
                  label: 'Password', hint: '••••••••', isPassword: true),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Logic for login will be added later
                  // For now, let's navigate to home for demonstration
                  context.go('/');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4D5D42),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () => context.go('/signup'),
                style: OutlinedButton.styleFrom(
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
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFF4A4A4A),
                  ),
                ),
              ),
              const Spacer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(color: Colors.black26)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'or sign up with',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.black26)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialButton(Icons.camera_alt_outlined),
                  const SizedBox(width: 16),
                  _buildSocialButton(Icons.g_mobiledata),
                  const SizedBox(width: 16),
                  _buildSocialButton(Icons.facebook),
                  const SizedBox(width: 16),
                  _buildSocialButton(Icons.chat_bubble_outline),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.black54),
                  ),
                  TextButton(
                    onPressed: () => context.go('/signup'),
                    child: const Text(
                      'Sign Up',
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
    );
  }

  Widget _buildTextField(
      {required String label, required String hint, bool isPassword = false}) {
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

  Widget _buildSocialButton(IconData icon) {
    return IconButton(
      onPressed: () {},
      icon: Icon(icon, color: const Color(0xFF4D5D42), size: 30),
    );
  }
}
