// Packages
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;
  final String subtitle;

  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => scaffoldKey.currentState!.openDrawer(),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Text(subtitle, style: const TextStyle(fontSize: 12)),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout, color: Colors.white),
          onPressed: () {
            // print("Logout tapped");
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.asset('assets/app_icon.png'),
          ),
        ),
      ],
      backgroundColor: Colors.green,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
