// To parse this JSON data, do
//
//     final appConfigModel = appConfigModelFromJson(jsonString);

import 'dart:convert';

AppConfigModel appConfigModelFromJson(String str) =>
    AppConfigModel.fromJson(json.decode(str));

String appConfigModelToJson(AppConfigModel data) => json.encode(data.toJson());

class AppConfigModel {
  String appname;
  String primaryColor;

  AppConfigModel({
    required this.appname,
    required this.primaryColor,
  });

  factory AppConfigModel.fromJson(Map<String, dynamic> json) => AppConfigModel(
        appname: json["appname"],
        primaryColor: json["primary_color"],
      );

  Map<String, dynamic> toJson() => {
        "appname": appname,
        "primary_color": primaryColor,
      };
}
