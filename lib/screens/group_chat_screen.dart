// Packages
import 'package:flutter/material.dart';

// Utils
import '../utils/bottom_nav_handler.dart';

// Widgets
import '../widgets/drawer_widget.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/app_bar_widget.dart';

class GroupChatScreen extends StatefulWidget {
  const GroupChatScreen({super.key});

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
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
        title: 'Group Chat',
        subtitle: 'DgMentor',
      ),
      drawer: const DrawerWidget(),
      body: const Center(child: Text('Group Chat Screen Content')),
      bottomNavigationBar: CustomBottomNavBar(
        onIndexChanged: _onIndexChanged,
        initialIndex: 2, // Group Chat screen is index 2
      ),
    );
  }
}
