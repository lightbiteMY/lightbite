import 'package:flutter/material.dart';
import 'package:lightbite/models/datetime_model.dart';
import 'package:lightbite/models/notification_model.dart';

const status = {
  "System": Icons.settings,
  "Order Made": Icons.shopping_cart_checkout,
  "Order Received": Icons.done,
  "Preparing": Icons.outdoor_grill,
  "Delivering": Icons.local_shipping,
  "Completed": Icons.price_check
};

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
                  leading: notification.readStatus
                      ? CircleAvatar(
                          child: Icon(status[notification.tag]),
                        )
                      : Badge(
                          child: CircleAvatar(
                          child: Icon(status[notification.tag]),
                        )),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        notification.title,
                        style: notification.readStatus
                            ? const TextStyle(fontWeight: FontWeight.normal)
                            : const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateTimeModel(notification.datetime).getDisplayDateTime,
                        style: notification.readStatus
                            ? const TextStyle(fontSize: 9)
                            : const TextStyle(
                                fontSize: 9, fontWeight: FontWeight.bold),
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
