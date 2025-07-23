// Packages
import 'package:flutter/material.dart';

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
          ),
          ListTile(
            leading: const Icon(Icons.chat, color: Colors.green),
            title: const Text('ChatBot'),
          ),
          ListTile(
            leading: const Icon(Icons.subscriptions, color: Colors.green),
            title: const Text('Subscribe Course'),
          ),
          ListTile(
            leading: const Icon(Icons.refresh, color: Colors.green),
            title: const Text('Refresh'),
          ),
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.green),
            title: const Text('Notifications'),
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.green),
            title: const Text('Select Language'),
          ),
          ListTile(
            leading: const Icon(Icons.support, color: Colors.green),
            title: const Text('Chat Support'),
          ),
          ListTile(
            leading: const Icon(Icons.assessment, color: Colors.green),
            title: const Text('Progress Report'),
          ),
          ListTile(
            leading: const Icon(Icons.group, color: Colors.green),
            title: const Text('Group Chat'),
          ),
          ListTile(
            leading: const Icon(Icons.business, color: Colors.green),
            title: const Text('Facility Management'),
          ),
          ListTile(
            leading: const Icon(Icons.score, color: Colors.green),
            title: const Text('Score Card'),
          ),
          ListTile(
            leading: const Icon(Icons.person_pin, color: Colors.green),
            title: const Text('Nearby Trainers'),
          ),
          ListTile(
            leading: const Icon(Icons.poll, color: Colors.green),
            title: const Text('Survey'),
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.green),
            title: const Text('Sign out'),
          ),
        ],
      ),
    );
  }
}
