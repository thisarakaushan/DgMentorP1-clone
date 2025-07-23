import 'package:flutter/material.dart';

class FinancialDiariesScreen extends StatelessWidget {
  const FinancialDiariesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Diaries'),
        backgroundColor: Colors.green,
      ),
      body: const Center(child: Text('Financial Diaries Screen Content')),
    );
  }
}
