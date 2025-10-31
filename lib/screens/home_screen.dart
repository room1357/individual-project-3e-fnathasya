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
    await PreferencesHelper.setLoggedOut();
    if (mounted) Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const Scaffold(body: Center(child: CircularProgressIndicator()));

    final avatarUrl = (user != null && user!.username.isNotEmpty)
        ? 'https://i.pravatar.cc/150?u=${Uri.encodeComponent(user!.username)}'
        : 'https://i.pravatar.cc/150?img=65';

    final features = [
      {'label': 'Profile', 'icon': Icons.person, 'route': '/profile'},
      {'label': 'Gallery', 'icon': Icons.photo, 'route': '/gallery'},
      {'label': 'Business Card', 'icon': Icons.badge, 'route': '/card'},
      {'label': 'Settings', 'icon': Icons.settings, 'route': '/settings'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: _logout, icon: const Icon(Icons.logout)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // header with avatar + name
            Row(
              children: [
                CircleAvatar(radius: 36, backgroundImage: NetworkImage(avatarUrl)),
                const SizedBox(width: 12),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(user?.username ?? 'Guest', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(user?.role ?? 'FLUTTER DEVELOPER', style: const TextStyle(color: Colors.grey)),
                ]),
              ],
            ),
            const SizedBox(height: 20),
            // features grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: features.map((f) {
                  return InkWell(
                    onTap: () => Navigator.pushNamed(context, f['route'] as String),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.teal.shade100),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(f['icon'] as IconData, size: 40, color: Colors.teal),
                          const SizedBox(height: 8),
                          Text(f['label'] as String, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}