// Packages
import 'package:flutter/material.dart';

// Widgets
import '../widgets/drawer_widget.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/app_bar_widget.dart';

// Utils
import '../utils/routes.dart';
import '../utils/bottom_nav_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFFFFF9C4),
              child: Image.asset('assets/images/slider_image.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Courses...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.green[100],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'COURSES',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Colors.green, width: 2),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Image.asset('assets/images/course1_image.png'),
                  title: const Text('Finclusion'),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.course,
                      arguments: {'courseName': 'Finclusion'},
                    );
                  },
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Colors.green, width: 2),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Image.asset('assets/images/course2_image.png'),
                  title: const Text('E Business'),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.course,
                      arguments: {'courseName': 'E Business'},
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'PLAYBOOKS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Colors.green, width: 2),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Image.asset('assets/images/playbook1_image.png'),
                  title: const Text('Financial Literacy'),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.course,
                      arguments: {'courseName': 'Financial Literacy'},
                    );
                  },
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Colors.green, width: 2),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: Image.asset('assets/images/playbook2_image.png'),
                  title: const Text('Digital Literacy'),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.course,
                      arguments: {'courseName': 'Digital Literacy'},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onIndexChanged: _onIndexChanged,
        initialIndex: 0, // Set initial index to 0 for Home
      ),
    );
  }
}
