import 'package:flutter/material.dart';
import '../models/user.dart';
import '../utils/preferences_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final loaded = await PreferencesHelper.getUser();
    if (mounted) {
      setState(() {
        user = loaded;
        loading = false;
      });
    }
  }

  Future<void> _logout() async {
    await PreferencesHelper.clearAll();
    if (mounted) Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    final avatarUrl = (user != null && user!.username.isNotEmpty)
        ? 'https://i.pravatar.cc/150?u=${Uri.encodeComponent(user!.username)}'
        : 'https://i.pravatar.cc/150?img=65';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: _logout, icon: const Icon(Icons.logout))],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(radius: 50, backgroundImage: NetworkImage(avatarUrl)),
          const SizedBox(height: 12),
          Text(user?.username ?? 'Guest', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/profile'), child: const Text('View Profile')),
          const SizedBox(height: 8),
          OutlinedButton(onPressed: _logout, child: const Text('Logout')),
        ]),
      ),
    );
  }
}