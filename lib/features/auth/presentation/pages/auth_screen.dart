import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AuthScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
