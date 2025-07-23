import 'package:flutter/material.dart';

class NearByTrainersScreen extends StatelessWidget {
  const NearByTrainersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Trainers'),
        backgroundColor: Colors.green,
      ),
      body: const Center(child: Text('Nearby Trainers Screen Content')),
    );
  }
}
