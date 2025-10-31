import 'package:flutter/material.dart';

class ImageGallery extends StatelessWidget {
  final int imageCount;
  
  const ImageGallery({
    Key? key,
    this.imageCount = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        const Text('My Gallery', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.teal)),
        const SizedBox(height: 10),
        SizedBox(
          height: 300,
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            padding: const EdgeInsets.all(8),
            children: List.generate(imageCount, (index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 5,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network('https://picsum.photos/300/300?random=$index', fit: BoxFit.cover),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}