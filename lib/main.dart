import 'package:flutter/material.dart';
import 'screens/detail_screen.dart';
import 'screens/home_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Example',
      // 1. Definisikan initialRoute
      initialRoute: '/',
      // 2. Definisikan semua rute yang tersedia
      routes: {
        '/': (context) => HomeScreen(),
        // Kita akan menangani rute '/detail' secara khusus nanti
        // untuk bisa membaca argumen.
        '/settings': (context) => SettingsScreen(),
      },
      // 3. Gunakan onGenerateRoute untuk rute yang butuh logika tambahan
      onGenerateRoute: (settings) {
        if (settings.name == DetailScreen.routeName) {
          // Ekstrak argumen yang dikirim
          final args = settings.arguments as String;

          // Buat MaterialPageRoute
          return MaterialPageRoute(
            builder: (context) {
              return DetailScreen(productId: args);
            },
          );
        }
        // Jika rute tidak ditemukan, bisa tampilkan halaman error
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
