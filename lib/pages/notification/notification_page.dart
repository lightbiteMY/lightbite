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
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        notification.title,
                        style: notification.readStatus
                            ? const TextStyle(fontWeight: FontWeight.bold)
                            : const TextStyle(fontWeight: FontWeight.normal),
                      ),
                      Text(
                        DateTimeModel(notification.datetime).getDisplayDateTime,
                        style: notification.readStatus
                            ? const TextStyle(
                                fontSize: 9, fontWeight: FontWeight.bold)
                            : const TextStyle(fontSize: 9),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    notification.subtitle +
                        notification.subtitle +
                        notification.subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: notification.readStatus
                        ? const TextStyle(
                            fontSize: 10,
                          )
                        : const TextStyle(fontSize: 10),
                  ),
                ),
                // const Divider(),
              ],
            ),
          )
          .toList(),
    );
  }
}
