// Packages
import 'package:flutter/material.dart';

// Utils
import '../utils/routes.dart';

class CourseScreen extends StatelessWidget {
  final Map<String, dynamic>? arguments;

  const CourseScreen({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    final courseName = arguments?['courseName'] ?? 'Course Name';
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
        backgroundColor: Colors.green,
        actions: [
          IconButton(icon: const Icon(Icons.leaderboard), onPressed: () {}),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/app_icon.png'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Course Progress', style: TextStyle(fontSize: 16)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: LinearProgressIndicator(
                value: 0.0,
                backgroundColor: Colors.grey[300],
                color: Colors.green,
                minHeight: 10,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Module',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                leading: SizedBox(
                  width: 60,
                  height: 60,
                  child: Image.asset(
                    'assets/images/course1_module1_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text('Fraud and Security'),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.0,
                        backgroundColor: Colors.grey[300],
                        color: Colors.green,
                        minHeight: 10,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text('0%'),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.module,
                    arguments: {
                      'moduleName': 'Fraud and Security',
                      'courseName': courseName,
                    },
                  );
                },
              ),
            ),
            Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                leading: SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    'assets/images/course1_module2_image.png',
                    fit: BoxFit.cover,
                  ),
                ),
                title: const Text('Digital Literacy'),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.0,
                        backgroundColor: Colors.grey[300],
                        color: Colors.green,
                        minHeight: 10,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text('0%'),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.module,
                    arguments: {
                      'moduleName': 'Digital Literacy',
                      'courseName': courseName,
                    },
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'SHORTS',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: const [
                      Tab(text: 'Fraud and Security'),
                      Tab(text: 'Digital Literacy'),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: TabBarView(
                      children: [
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Card(
                              margin: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: const Text('Video 1'),
                                trailing: const Icon(Icons.play_arrow),
                              ),
                            ),
                          ],
                        ),
                        ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Card(
                              margin: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: const Text('Video 1'),
                                trailing: const Icon(Icons.play_arrow),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
