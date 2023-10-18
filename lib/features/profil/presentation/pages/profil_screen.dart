import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProfilScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
