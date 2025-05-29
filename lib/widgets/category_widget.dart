import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const CategoryChip({required this.label, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        backgroundColor: Colors.blue[100],
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: Colors.blue[900]),
            SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(color: Colors.blue[900]),
            ),
          ],
        ),
      ),
    );
  }
}
