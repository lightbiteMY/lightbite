import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:lightbite/models/notification_model.dart';
import 'package:lightbite/services/notification_api.dart';

class NotificationListProvider extends ChangeNotifier {
  List<NotificationModel> _notificationList = [];

  UnmodifiableListView<NotificationModel> get notificationList =>
      UnmodifiableListView(_notificationList);

  NotificationApiService api = NotificationApiService();

  getNotificationList() async {
    _notificationList = await api.getNotificationList();

    notifyListeners();
  }
}
