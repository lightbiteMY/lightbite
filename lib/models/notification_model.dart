import 'dart:convert';

List<NotificationModel> notificationModelFromJson(String data) =>
    List<NotificationModel>.from(
        json.decode(data).map((x) => NotificationModel.fromJson(x)));

class NotificationModel {
  final String title;
  final String subtitle;
  final String notificationId;
  final String datetime;
  final bool readStatus;
  final String tag;

  const NotificationModel(this.title, this.subtitle, this.notificationId,
      this.datetime, this.readStatus, this.tag);

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      json["title"],
      json["subtitle"],
      json["notificationId"],
      json["datetime"],
      json["readStatus"],
      json["tag"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "notificationId": notificationId,
        "datetime": datetime,
        "readStatus": readStatus,
        "tag": tag,
      };
}
