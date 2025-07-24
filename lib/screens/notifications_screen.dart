// Packages
import 'package:flutter/material.dart';

// Utils
import '../utils/bottom_nav_handler.dart';

// Services
import '../services/notification_service.dart';

// Widgets
import '../widgets/drawer_widget.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/app_bar_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    NotificationService.initialize();
    NotificationService.setOnNotificationUpdate(
      _updateNotifications,
    ); // Register callback
    _loadNotifications();
  }

  void _loadNotifications() {
    setState(() {
      NotificationService.loadNotifications();
      _isLoading = false;
    });
  }

  void _updateNotifications() {
    setState(() {}); // Trigger UI rebuild when notifications change
  }

  void _markAsRead(int index) {
    setState(() {
      NotificationService.markAsRead(index);
    });
  }

  void _onIndexChanged(int index) {
    if (_scaffoldKey.currentContext != null) {
      NavHandler.handleBottomNavTap(_scaffoldKey.currentContext!, index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final notifications = NotificationService.getNotifications();
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
        title: 'Notifications',
        subtitle: 'DgMentor',
      ),
      drawer: const DrawerWidget(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : notifications.isEmpty
          ? const Center(child: Text('No notifications'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Card(
                  color: (notification['isRead'] as bool? ?? true)
                      ? Colors.white
                      : Colors.green[100],
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: const Icon(
                      Icons.notification_important,
                      color: Colors.green,
                    ),
                    title: Text(
                      notification['title'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(notification['body'] as String),
                        const SizedBox(height: 4),
                        Text(
                          _formatTimestamp(notification['timestamp'] as String),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    trailing: (notification['isRead'] as bool? ?? true)
                        ? null
                        : const Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 12,
                          ),
                    onTap: () => _markAsRead(index),
                  ),
                );
              },
            ),
      bottomNavigationBar: CustomBottomNavBar(
        onIndexChanged: _onIndexChanged,
        initialIndex: 5,
        unreadCount: NotificationService.getUnreadCount(),
      ),
    );
  }

  String _formatTimestamp(String timestamp) {
    final dateTime = DateTime.parse(timestamp);
    return '${dateTime.hour}:${dateTime.minute} ${dateTime.day}-${dateTime.month}-${dateTime.year}';
  }

  @override
  void dispose() {
    super.dispose();
  }
}
