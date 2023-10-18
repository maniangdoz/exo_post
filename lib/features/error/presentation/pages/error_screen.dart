import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ErrorScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ErrorScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
