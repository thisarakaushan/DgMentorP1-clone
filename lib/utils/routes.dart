import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/course_screen.dart';
import '../screens/module_screen.dart';
import '../screens/quiz_screen.dart';
import '../screens/result_screen.dart';
import '../screens/support_screen.dart';
import '../screens/group_chat_screen.dart';
import '../screens/nearby_trainers_screen.dart';
import '../screens/financial_diaries_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/refresh_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String course = '/course';
  static const String module = '/module';
  static const String quiz = '/quiz';
  static const String result = '/result';
  static const String support = '/support';
  static const String groupChat = '/group-chat';
  static const String nearbyTrainers = '/nearby-trainers';
  static const String financialDiaries = '/financial-diaries';
  static const String notifications = '/notifications';
  static const String refresh = '/refresh';

  static final Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    home: (context) => const HomeScreen(),
    course: (context) => const CourseScreen(),
    module: (context) => const ModuleScreen(),
    quiz: (context) => const QuizScreen(),
    // result is handled by onGenerateRoute
    support: (context) => const SupportScreen(),
    groupChat: (context) => const GroupChatScreen(),
    nearbyTrainers: (context) => const NearByTrainersScreen(),
    financialDiaries: (context) => const FinancialDiariesScreen(),
    notifications: (context) => const NotificationsScreen(),
    refresh: (context) => const RefreshScreen(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case result:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (context) => ResultScreen(
            totalQuestions: args?['totalQuestions'] ?? 0,
            correctAnswers: args?['correctAnswers'] ?? 0,
            timeTaken: args?['timeTaken'] ?? 0,
          ),
        );
      default:
        return null;
    }
  }
}
