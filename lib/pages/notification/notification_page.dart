import 'package:flutter/material.dart';
import 'package:lightbite/models/datetime_model.dart';
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
                  tileColor: notification.readStatus
                      ? Colors.green[50]
                      : Colors.red[50],
                  leading: notification.readStatus
                      ? const Icon(Icons.mark_email_read)
                      : const Icon(Icons.mark_email_unread),
                  title: Text(notification.title),
                  subtitle: Text(notification.subtitle),
                  trailing: Text(
                      DateTimeModel(notification.datetime).getDisplayDateTime),
                ),
                // const Divider(),
              ],
            ),
          )
          .toList(),
    );
  }
}
