import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import '../../widgets/category_widget.dart';

class HomeContent extends StatelessWidget {
  final List<Map<String, dynamic>> doctors = [
    {
      'name': 'Dr. Prithvi Raj',
      'specialty': 'Cardiologist',
      'rating': 4.5,
      'price': '800 EGP',
      'image': 'assets/images/vecteezy_online-doctor-consultation.png',
    },
    {
      'name': 'Dr.Harsha Vardhan',
      'specialty': 'Dermatologist',
      'rating': 4.8,
      'price': '600 EGP',
      'image': 'assets/images/vecteezy_online-doctor-consultation.png',
    },
    {
      'name': 'Dr. Pooja',
      'specialty': 'Dermatologist',
      'rating': 4.8,
      'price': '600 EGP',
      'image': 'assets/images/vecteezy_online-doctor-consultation.png',
    },
    {
      'name': 'Dr. Naga Sai',
      'specialty': 'Cardiologist',
      'rating': 4.5,
      'price': '800 EGP',
      'image': 'assets/images/vecteezy_online-doctor-consultation.png',
    },
    {
      'name': 'Dr.Pujith',
      'specialty': 'Neurologist',
      'rating': 4.7,
      'price': '750 EGP',
      'image': 'assets/images/vecteezy_online-doctor-consultation.png',
    },

    {
      'name': 'Dr. Sai Kiran',
      'specialty': 'Neurologist',
      'rating': 4.7,
      'price': '750 EGP',
      'image': 'assets/images/vecteezy_online-doctor-consultation.png',
    },
    // Add more doctors here
  ];

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<UserProvider>(context).username;

    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(username,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text("Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          SizedBox(height: 20),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              CategoryChip(label: "Dermatology", icon: Icons.face),
              CategoryChip(label: "Cardiology", icon: Icons.favorite),
              CategoryChip(label: "Neurology", icon: Icons.psychology),
              CategoryChip(label: "Pediatrics", icon: Icons.child_care),
              CategoryChip(label: "Dentistry", icon: Icons.medical_services),
              CategoryChip(label: "Orthopedics", icon: Icons.accessibility_new),
            ],
          ),

          SizedBox(height: 20),

          SizedBox(height: 20),

          Text("Top Doctors",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),

          SizedBox(height: 10),

          // ListView.builder inside SingleChildScrollView:
          ListView.builder(
            shrinkWrap: true, // Important to wrap inside another scroll view
            physics: NeverScrollableScrollPhysics(), // Disable inner scrolling
            itemCount: doctors.length,
            itemBuilder: (context, index) {
              final doctor = doctors[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(doctor['image']),
                ),
                title: Text(doctor['name']),
                subtitle:
                    Text('${doctor['specialty']} • ${doctor['rating']} ⭐'),
                trailing: Text(doctor['price']),
              );
            },
          ),
        ],
      ),
    );
  }
}
