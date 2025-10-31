import 'package:flutter/material.dart';
import '../models/user.dart';
import '../utils/preferences_helper.dart';
import '../widgets/business_card.dart';
import '../widgets/image_gallery.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final u = await PreferencesHelper.getUser();
    if (mounted)
      setState(() {
        user = u;
        loading = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    if (loading)
      return const Scaffold(body: Center(child: CircularProgressIndicator()));

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 16),
            Container(
                padding: const EdgeInsets.all(20.0),
                child: BusinessCard(
                  username: user?.username ?? 'Guest',
                  role: user?.role ?? 'FLUTTER DEVELOPER',
                  phone: user?.phone ?? '+62 000 0000',
                  email: user?.email ?? 'example@example.com',
                )),
            Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: const ImageGallery()),
          ]),
        ),
      ),
    );
  }
}
