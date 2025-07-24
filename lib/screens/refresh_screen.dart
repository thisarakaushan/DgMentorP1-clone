// Packages
import 'package:flutter/material.dart';

// Utils
import '../utils/routes.dart';

class RefreshScreen extends StatefulWidget {
  const RefreshScreen({super.key});

  @override
  State<RefreshScreen> createState() => _RefreshScreenState();
}

class _RefreshScreenState extends State<RefreshScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.home,
        (route) => false, // Removes all previous routes from stack
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Image(
          image: AssetImage('assets/refresh_icon.png'),
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
