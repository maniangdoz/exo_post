import 'package:exo_post/features/shared/presentation/widgets/comment_input.dart';
import 'package:flutter/material.dart';

class DetailPostScreen extends StatefulWidget {
  const DetailPostScreen({super.key});

  @override
  State<DetailPostScreen> createState() => _DetailPostScreenState();
}

class _DetailPostScreenState extends State<DetailPostScreen> {
  final _commentTextFieldController = TextEditingController();

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
      bottomSheet: SizedBox(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 0),
          child: CommentInput(
            commentTextFieldController: _commentTextFieldController,
          ),
        ),
      ),
    );
  }
}
