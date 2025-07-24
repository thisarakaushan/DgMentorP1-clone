// Packages
import 'package:flutter/material.dart';

// Utils
import '../utils/bottom_nav_handler.dart';

// Widgets
import '../widgets/drawer_widget.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/app_bar_widget.dart';

class FinancialDiariesScreen extends StatefulWidget {
  const FinancialDiariesScreen({super.key});

  @override
  State<FinancialDiariesScreen> createState() => _FinancialDiariesScreenState();
}

class _FinancialDiariesScreenState extends State<FinancialDiariesScreen> {
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
        title: 'Financial Diaries',
        subtitle: 'DgMentor',
      ),
      drawer: const DrawerWidget(),
      body: const Center(child: Text('Financial Diaries Screen Content')),
      bottomNavigationBar: CustomBottomNavBar(
        onIndexChanged: _onIndexChanged,
        initialIndex: 4, // Financial Diaries screen is index 4
      ),
    );
  }
}
