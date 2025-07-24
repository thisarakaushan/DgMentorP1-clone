// Packages
import 'package:flutter/material.dart';

// Utils
import '../utils/bottom_nav_handler.dart';

// Widgets
import '../widgets/drawer_widget.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/app_bar_widget.dart';

class NearByTrainersScreen extends StatefulWidget {
  const NearByTrainersScreen({super.key});

  @override
  State<NearByTrainersScreen> createState() => _NearByTrainersScreenState();
}

class _NearByTrainersScreenState extends State<NearByTrainersScreen> {
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
        title: 'Nearby Trainers',
        subtitle: 'DgMentor',
      ),
      drawer: const DrawerWidget(),
      body: const Center(child: Text('Nearby Trainers Screen Content')),
      bottomNavigationBar: CustomBottomNavBar(
        onIndexChanged: _onIndexChanged,
        initialIndex: 3, // Nearby Trainers screen is index 3
      ),
    );
  }
}
