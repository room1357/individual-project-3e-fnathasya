import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Layout'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // constraints.maxWidth akan berisi lebar maksimal yang tersedia
            if (constraints.maxWidth > 600) {
              // Jika layar lebar (misal: tablet, desktop)
              return Container(
                width: 400,
                height: 200,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Wide Layout (width: ${constraints.maxWidth.toStringAsFixed(0)})',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              );
            } else {
              // Jika layar sempit (misal: handphone)
              return Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Narrow Layout (width: ${constraints.maxWidth.toStringAsFixed(0)})',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
