import 'package:flutter/material.dart';
import 'package:lightbite/pages/notification/notification_page.dart';
import 'package:lightbite/providers/notification_list_provider.dart';
import 'package:provider/provider.dart';

class NotificationController extends StatefulWidget {
  const NotificationController({super.key});

  @override
  State<NotificationController> createState() => _NotificationControllerState();
}

class _NotificationControllerState extends State<NotificationController> {
  @override
  void initState() {
    super.initState();
    Provider.of<NotificationListProvider>(context, listen: false)
        .getNotificationList();
  }

  @override
  Widget build(BuildContext context) {
    final notificationListProvider =
        Provider.of<NotificationListProvider>(context);

    return NotificationPage(
        notificationList: notificationListProvider.notificationList);
  }
}
