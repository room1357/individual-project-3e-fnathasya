import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  final String username;
  final String role;
  final String phone;
  final String email;

  const BusinessCard({
    Key? key,
    required this.username,
    this.role = 'FLUTTER DEVELOPER',
    this.phone = '+62 123 4567 890',
    this.email = 'user@example.com',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatarUrl = 'https://i.pravatar.cc/150?u=${Uri.encodeComponent(username)}';
    return Column(
      children: [
        CircleAvatar(radius: 50.0, backgroundImage: NetworkImage(avatarUrl)),
        const SizedBox(height: 12),
        Text(username, style: const TextStyle(fontSize: 32.0, color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        Text(role, style: const TextStyle(color: Colors.white70, fontSize: 18.0, letterSpacing: 2.0)),
        const SizedBox(height: 16),
        Card(margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0), child: ListTile(
          leading: const Icon(Icons.phone, color: Colors.teal),
          title: Text(phone, style: const TextStyle(color: Colors.teal)),
        )),
        Card(margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0), child: ListTile(
          leading: const Icon(Icons.email, color: Colors.teal),
          title: Text(email, style: const TextStyle(color: Colors.teal)),
        )),
      ],
    );
  }
}