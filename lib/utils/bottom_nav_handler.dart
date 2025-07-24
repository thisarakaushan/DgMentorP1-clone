// Packages
import 'package:flutter/material.dart';

// Utils
import './routes.dart';

class NavHandler {
  static void handleBottomNavTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, AppRoutes.home);
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.support);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.groupChat);
        break;
      case 3:
        Navigator.pushNamed(context, AppRoutes.nearbyTrainers);
        break;
      case 4:
        Navigator.pushNamed(context, AppRoutes.financialDiaries);
        break;
      case 5:
        Navigator.pushNamed(context, AppRoutes.notifications);
        break;
    }
  }
}
