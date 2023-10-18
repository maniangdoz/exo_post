import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RegisterScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
