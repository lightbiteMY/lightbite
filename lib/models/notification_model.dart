import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String data) =>
    List<NotificationModel>.from(
        json.decode(data).map((x) => NotificationModel.fromJson(x)));

class NotificationModel {
  final String title;
  final String subtitle;
  final String notificationId;

  const NotificationModel(this.title, this.subtitle, this.notificationId);

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      json["title"],
      json["subtitle"],
      json["notificationId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "notificationId": notificationId,
      };
}
