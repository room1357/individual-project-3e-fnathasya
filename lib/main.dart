import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/register_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/business_card_screen.dart';
import 'screens/settings_screen.dart';
import 'utils/preferences_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final user = await PreferencesHelper.getUser();
  final bool isLoggedIn = user != null;
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
        '/gallery': (context) => const GalleryScreen(),
        '/card': (context) => const BusinessCardScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}