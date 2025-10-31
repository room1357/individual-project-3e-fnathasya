import 'package:flutter/material.dart';

class SimpleImageGallery extends StatelessWidget {
  const SimpleImageGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // 2 kolom
        mainAxisSpacing: 8, // Spasi vertikal
        crossAxisSpacing: 8, // Spasi horizontal
        padding: EdgeInsets.all(8),
        children: List.generate(10, (index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://picsum.photos/200/200?random=$index',
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
      ),
    );
  }
}
