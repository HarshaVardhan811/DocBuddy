import 'package:flutter/material.dart';
import 'package:newproj/widgets/text_field_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/customfilled_button_widget.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isPasswordHidden = true;

  Future<void> registerUser() async {
    final name = nameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    if (name.isNotEmpty && email.isNotEmpty && password.length >= 6) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('registeredEmail', email);
      await prefs.setString('registeredPassword', password);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registration successful")));
      Navigator.pop(context); // Go back to login screen
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please fill all fields properly")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(Icons.local_hospital, size: 200, color: Colors.blue),
                ),
                Center(
                  child: Text("Register",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  controller: nameController,
                  label: 'Name',
                  hintText: "Enter Your Name",
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: emailController,
                  label: 'Email',
                  hintText: "Enter Your Email",
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: passwordController,
                  label: 'Password',
                  hintText: "Enter Your Password",
                  obscureText:_isPasswordHidden,
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
                SizedBox(height: 30),
                CustomFilledButton(
                  onPressed: registerUser,
                  text: "Sign Up",
                ),
                SizedBox(height: 10),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Already have an account? Sign In",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
