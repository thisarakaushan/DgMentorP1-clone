// Packages
import 'package:flutter/material.dart';

// Utils
import '../utils/bottom_nav_handler.dart';

// Widgets
import '../widgets/drawer_widget.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/app_bar_widget.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onIndexChanged(int index) {
    if (_scaffoldKey.currentContext != null) {
      NavHandler.handleBottomNavTap(_scaffoldKey.currentContext!, index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
        title: 'Welcome Thisara',
        subtitle: 'DgMentor',
      ),
      drawer: const DrawerWidget(),
      body: const Center(child: Text('Support Screen Content')),
      bottomNavigationBar: CustomBottomNavBar(
        onIndexChanged: _onIndexChanged,
        initialIndex: 1, // Support screen is index 1
      ),
    );
  }
}
