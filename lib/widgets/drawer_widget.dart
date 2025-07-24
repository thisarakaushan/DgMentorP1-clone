// Packages
import 'package:flutter/material.dart';

// Utils
import '../utils/routes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            margin: EdgeInsets.zero, // Remove default margin
            child: SizedBox(
              height: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(),
                  SizedBox(height: 10),
                  Text('Thisara User', style: TextStyle(color: Colors.white)),
                  Text(
                    'Intern Group',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.search, color: Colors.green),
            title: const Text('Search'),
            onTap: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat, color: Colors.green),
            title: const Text('ChatBot'),
            onTap: () {
              Navigator.pushNamed(context, '/chatbot');
            },
          ),
          ListTile(
            leading: const Icon(Icons.subscriptions, color: Colors.green),
            title: const Text('Subscribe Course'),
            onTap: () {
              Navigator.pushNamed(context, '/subscribe');
            },
          ),
          ListTile(
            leading: const Icon(Icons.refresh, color: Colors.green),
            title: const Text('Refresh'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.refresh);
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.green),
            title: const Text('Notifications'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.notifications);
            },
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.green),
            title: const Text('Select Language'),
            onTap: () {
              Navigator.pushNamed(context, '/language');
            },
          ),
          ListTile(
            leading: const Icon(Icons.support, color: Colors.green),
            title: const Text('Chat Support'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.support);
            },
          ),
          ListTile(
            leading: const Icon(Icons.assessment, color: Colors.green),
            title: const Text('Progress Report'),
            onTap: () {
              Navigator.pushNamed(context, '/progressReport');
            },
          ),
          ListTile(
            leading: const Icon(Icons.group, color: Colors.green),
            title: const Text('Group Chat'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.groupChat);
            },
          ),
          ListTile(
            leading: const Icon(Icons.business, color: Colors.green),
            title: const Text('Facility Management'),
            onTap: () {
              Navigator.pushNamed(context, '/facilityManagement');
            },
          ),
          ListTile(
            leading: const Icon(Icons.score, color: Colors.green),
            title: const Text('Score Card'),
            onTap: () {
              Navigator.pushNamed(context, '/scoreCard');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_pin, color: Colors.green),
            title: const Text('Nearby Trainers'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.nearbyTrainers);
            },
          ),
          ListTile(
            leading: const Icon(Icons.poll, color: Colors.green),
            title: const Text('Survey'),
            onTap: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Coming Soon!")));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.green),
            title: const Text('Sign out'),
            onTap: () async {
              // await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
