import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/customfilled_button_widget.dart';
import '../widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isPasswordHidden = true;

  Future<void> loginUser() async {
    final email = emailController.text;
    final password = passwordController.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? savedEmail = prefs.getString('registeredEmail');
    String? savedPassword = prefs.getString('registeredPassword');

    if (email == savedEmail && password == savedPassword) {
      await prefs.setBool('isLoggedIn', true);
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid credentials")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Spacer(),
            Icon(Icons.local_hospital, size: 200, color: Colors.blue),

            Text("Your Doctor", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),

            CustomTextField(
              controller: emailController,
              label: 'Email',
              hintText: 'Enter your email',
            ),
            SizedBox(height: 10,),
            CustomTextField(
              controller: passwordController,
              label: 'Password',
              hintText: 'Enter your password',
              obscureText: _isPasswordHidden,
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordHidden = !_isPasswordHidden;
                  });
                },
              ),
            ),

            SizedBox(height: 20),
            CustomFilledButton(
              onPressed: loginUser,
              text: "Sign In",
            ),


            TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: Text("Don't have an account? Sign Up",
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
