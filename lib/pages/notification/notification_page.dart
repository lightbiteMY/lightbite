import 'package:flutter/material.dart';
import 'package:lightbite/models/notification_model.dart';

class NotificationPage extends StatelessWidget {
  final List<NotificationModel> notificationList;
  const NotificationPage({
    super.key,
    required this.notificationList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: notificationList
          .map(
            (notification) => Column(
              children: [
                ListTile(
                  title: Text(notification.title),
                  subtitle: Text(notification.subtitle),
                ),
                const Divider(),
              ],
            ),
          )
          .toList(),
    );
  }
}
