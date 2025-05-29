import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final username = Provider.of<UserProvider>(context).username;

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Doctor"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isLoggedIn', false); // Clear login state

              Navigator.of(context).pushReplacementNamed('/login');
            },


            tooltip: "Logout",
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(username, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text("Top Doctors", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/images/vecteezy_online-doctor-consultation.png"),
              ),
              title: Text("Dr. Samira Ali"),
              subtitle: Text("Dermatologist • 4.8 ⭐"),
              trailing: Text("600 EGP"),
            ),
            // Add more ListTiles based on your UI
          ],
        ),
      ),
    );
  }
}
