import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This is a dummy list of notifications. In a real app, you'd fetch this from a database or API.
    final List<Map<String, String>> notifications = [
      {
        'title': 'New Course Available',
        'body': 'Check out our new course on Flutter Development!',
        'time': '2 hours ago'
      },
      {
        'title': 'Upcoming Webinar',
        'body': 'Don\'t miss our webinar on Advanced React Techniques this Friday.',
        'time': '1 day ago'
      },
      {
        'title': 'Course Update',
        'body': 'We\'ve updated the content for the Python for Beginners course.',
        'time': '3 days ago'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Text('No notifications'),
            )
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.notifications, color: Colors.white),
                    ),
                    title: Text(
                      notification['title']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(notification['body']!),
                    trailing: Text(
                      notification['time']!,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    onTap: () {
                      // Handle notification tap
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Notification: ${notification['title']} tapped')),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}