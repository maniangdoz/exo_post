import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PostScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
