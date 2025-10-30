import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';

// show all contact info
void showContactInfo(Map<String, dynamic> contactInfo) {
  print('--- Details Contact ---');
  print('Name: ${contactInfo['name']}');
  print('Age: ${contactInfo['age']} years');
  print('Phone Number: ${contactInfo['phoneNumber']}');

  // show hobbies
  List<dynamic> hobbies = contactInfo['hobbies'];
  print('Hobbies:');
  for (var hobby in hobbies) {
    print('- $hobby');
  }

  // show email with null check
  String? email = contactInfo['email'];
  if (email != null) {
    print('Email: $email');
  } else {
    print('Email is not provided.');
  }
  print('Active: ${contactInfo['is_active'] ? "Yes" : "No"}');
  print('----------------------');
}

void main() {
  runApp(const MyApp());
  // final -> immutable
  final String name = "FNATHASYA";
  final int birthYear = 2005;
  //  var -> mutable
  var phoneNumber = "081230948205";
  // list -> array
  var hobbies = ["Reading", "Traveling", "Singing"];

  // count age
  var currentYear = DateTime.now().year;
  var age = currentYear - birthYear;

  print("Name: $name");
  print("Age: $age");
  print("Phone Number: $phoneNumber");
  print("Hobbies: ");

  // email nullable
  String? email;
  // email not null
  void printEmail(String? emailAddress) {
    if (emailAddress != null) {
      print("Email: $emailAddress");
    } else {
      print("Email is not provided.");
    }
  }

  // email not defined
  printEmail(email);

  // add email
  email = 'faizaanathasya@gmail.com';
  printEmail(email);

  // map for save contact
  final Map<String, dynamic> contact = {
    'name': 'FNATHASYA',
    'age': 20,
    'phone': '081230948205',
    'hobbies': ['Reading', 'Traveling', 'Singing'],
    'email': 'faizaanathasya@gmail.com',
    'is_active': true,
  };

  // access data from map
  print('Name from map: ${contact['name']}');
  print('first hobby : ${contact['hobbies'][0]}');

  final Map<String, dynamic> contactInfo = {
    'name': 'FNATHASYA',
    'age': 20,
    'phoneNumber': '081230948205',
    'hobbies': ['Reading', 'Traveling', 'Singing'],
    'email': 'faizaanathasya@gmail.com',
    'is_active': true,
  };

  showContactInfo(contactInfo);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginScreen(),
    );
  }
}
