// Packages
import 'package:flutter/material.dart';

// Utils
import '../utils/routes.dart';

class ModuleScreen extends StatelessWidget {
  final Map<String, dynamic>? arguments;

  const ModuleScreen({super.key, this.arguments});

  @override
  Widget build(BuildContext context) {
    final moduleName = arguments?['moduleName'] ?? 'Module Name';
    // final courseName = arguments?['courseName'] ?? 'Course Name';
    return DefaultTabController(
      initialIndex: 1, // Set initial tab to "Contents" (index 1)
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(moduleName),
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
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Assessment'),
              Tab(text: 'Contents'),
              Tab(text: 'Feedback'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const AssessmentTab(),
            const ContentsTab(),
            const FeedbackTab(),
          ],
        ),
      ),
    );
  }
}

class AssessmentTab extends StatelessWidget {
  const AssessmentTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Take Assessment'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.quiz);
            },
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.visibility),
            title: const Text('View Results'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.result);
            },
          ),
        ),
      ],
    );
  }
}

class ContentsTab extends StatelessWidget {
  const ContentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Chapters'),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Take Exam'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.quiz);
            },
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.visibility),
            title: const Text('View Results'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.result);
            },
          ),
        ),
      ],
    );
  }
}

class FeedbackTab extends StatelessWidget {
  const FeedbackTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Take Survey'),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Feedback'),
          ),
        ),
        Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Assignment'),
          ),
        ),
      ],
    );
  }
}
