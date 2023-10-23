import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'UserScreen is working',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
