import 'package:flutter/material.dart';

class GroupChatScreen extends StatelessWidget {
  const GroupChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Group Chat'),
        backgroundColor: Colors.green,
      ),
      body: const Center(child: Text('Group Chat Screen Content')),
    );
  }
}
