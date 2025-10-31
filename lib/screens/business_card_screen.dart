import 'package:flutter/material.dart';
import '../widgets/business_card.dart';
import '../utils/preferences_helper.dart';
import '../models/user.dart';

class BusinessCardScreen extends StatefulWidget {
  const BusinessCardScreen({Key? key}) : super(key: key);

  @override
  State<BusinessCardScreen> createState() => _BusinessCardScreenState();
}

class _BusinessCardScreenState extends State<BusinessCardScreen> {
  User? user;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final u = await PreferencesHelper.getUser();
    if (mounted) {
      setState(() {
        user = u;
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Business Card')),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Center(
          child: BusinessCard(
            username: user?.username ?? 'Guest',
            role: user?.role ?? 'FLUTTER DEVELOPER',
            phone: user?.phone ?? '+62 000 0000',
            email: user?.email ?? 'example@example.com',
          ),
        ),
      ),
    );
  }
}