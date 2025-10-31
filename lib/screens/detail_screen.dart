import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // Definisikan nama rute sebagai konstanta statis
  static const routeName = '/detail';

  final String productId;

  const DetailScreen({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail for $productId'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Showing details for $productId',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Kembali ke layar sebelumnya
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
