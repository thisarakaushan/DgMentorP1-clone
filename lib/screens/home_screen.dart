// Packages
import 'package:flutter/material.dart';

// Screens
// import './course_screen.dart';

// Widgets
import '../widgets/drawer_widget.dart';
import '../widgets/custom_bottom_nav.dart';

// Utils
import '../utils/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onIndexChanged(int index) {
    if (_scaffoldKey.currentContext != null) {
      switch (index) {
        case 0:
          Navigator.pushNamed(_scaffoldKey.currentContext!, AppRoutes.home);
          break;
        case 1:
          Navigator.pushNamed(_scaffoldKey.currentContext!, AppRoutes.support);
          break;
        case 2:
          Navigator.pushNamed(
            _scaffoldKey.currentContext!,
            AppRoutes.groupChat,
          );
          break;
        case 3:
          Navigator.pushNamed(
            _scaffoldKey.currentContext!,
            AppRoutes.nearbyTrainers,
          );
          break;
        case 4:
          Navigator.pushNamed(
            _scaffoldKey.currentContext!,
            AppRoutes.financialDiaries,
          );
          break;
        case 5:
          Navigator.pushNamed(
            _scaffoldKey.currentContext!,
            AppRoutes.notifications,
          );
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome Thisara'),
            Text('DgMentor', style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/app_icon.png'),
            ),
          ),
        ],
        backgroundColor: Colors.green,
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
      bottomNavigationBar: CustomBottomNavBar(onIndexChanged: _onIndexChanged),
    );
  }
}
