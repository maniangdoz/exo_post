import 'package:flutter/material.dart';

class DetailPostScreen extends StatelessWidget {
  const DetailPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPostScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailPostScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
