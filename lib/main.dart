import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/register_screen.dart';
import 'screens/profile_screen.dart';
import 'utils/preferences_helper.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final user = await PreferencesHelper.getUser();

  // ==== temporary: create sample user if none (untuk testing) ====
  if (user == null) {
    final sample = User(username: 'testuser', email: 'test@example.com', phone: '+62000');
    await PreferencesHelper.saveUser(sample);
    print('Created sample user for testing');
  }
  // ==============================================================

  final bool isLoggedIn = (await PreferencesHelper.getUser()) != null;
  runApp(MyApp(isLoggedIn: isLoggedIn));
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}