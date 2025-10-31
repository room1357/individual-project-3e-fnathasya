import 'package:flutter/material.dart';
import '../utils/preferences_helper.dart';
import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    final ok = await PreferencesHelper.checkCredentials(
      _usernameController.text.trim(),
      _passwordController.text.trim(),
    );

    if (ok) {
      // load saved user (if exists) and ensure isLoggedIn true
      final user = await PreferencesHelper.getUser();
      if (user == null) {
        // minimal fallback user
        await PreferencesHelper.saveUser(
            User(username: _usernameController.text.trim()));
      }
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Invalid credentials')));
      }
    }
    if (mounted) setState(() => _loading = false);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Login'), automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                          labelText: 'Username', border: OutlineInputBorder()),
                      validator: (v) => (v == null || v.isEmpty)
                          ? 'Please enter username'
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          labelText: 'Password', border: OutlineInputBorder()),
                      obscureText: true,
                      validator: (v) => (v == null || v.isEmpty)
                          ? 'Please enter password'
                          : null,
                    ),
                    const SizedBox(height: 24),
                    _loading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _login, child: const Text('Login')),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/register'),
                      child: const Text("Don't have an account? Register"),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
