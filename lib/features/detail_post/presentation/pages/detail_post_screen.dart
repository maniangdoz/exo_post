import 'package:exo_post/features/post/presentation/widgets/post_card.dart';
import 'package:exo_post/features/post/presentation/widgets/skeleton_post.dart';
import 'package:flutter/material.dart';

class DetailPostScreen extends StatelessWidget {
  const DetailPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: List.generate(
                10, // Replace this with your actual item count
                (index) => ListTile(
                  title: Text('List item $index'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
