import 'package:flutter/material.dart';

class DigitalBusinessCard extends StatelessWidget {
  const DigitalBusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 50.0,
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?img=12'),
              ),
              const Text(
                'Faiza Anathasya',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'UI/UX DESIGNER & FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.teal.shade100,
                  fontSize: 18.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: const ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+62 812 3456 7890',
                    style: TextStyle(
                      color: Color(0xFF004D40),
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: const ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'faiza.anathasya@example.com',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF004D40),
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
              Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: const ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'Malang, Indonesia',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xFF004D40),
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
