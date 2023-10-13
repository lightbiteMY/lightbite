import 'package:http/http.dart' as http;
import 'package:lightbite/models/notification_model.dart';

class NotificationApiService {
  Future<List<NotificationModel>> getNotificationList() async {
    var response = await http.get(
        Uri.parse("http://localhost:3000/notification/v1/getNotificationList"));

    if (response.statusCode == 200) {
      var data = response.body;
      return notificationModelFromJson(data);
    }
    throw Exception();
  }
}
