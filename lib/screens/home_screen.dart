import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigasi ke halaman settings
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          final productId = 'Product ${index + 1}';
          return ListTile(
            title: Text(productId),
            onTap: () {
              // Navigasi ke halaman detail dengan mengirim argumen
              Navigator.pushNamed(
                context,
                DetailScreen.routeName,
                arguments: productId,
              );
            },
          );
        },
      ),
    );
  }
}
