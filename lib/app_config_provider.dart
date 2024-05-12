import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:json_read_app/env.dart';
import 'package:json_read_app/main.dart';
import 'package:json_read_app/model/app_config_model.dart';

class AppConfigProvider extends ChangeNotifier {
  AppConfigModel? appeConfig;

  void loadConfig() async {
    var env = envirnment;
    if (env['config'].toString().contains("http")) {
      var response = await http.get(Uri.parse(env['config']));
      appeConfig = AppConfigModel.fromJson(jsonDecode(response.body));
      notifyListeners();
      print(jsonDecode(response.body));
    } else {
      final json = jsonDecode(
          await DefaultAssetBundle.of(navigationKey.currentContext!)
              .loadString(env['config']));
      appeConfig = AppConfigModel.fromJson(json);
      notifyListeners();
      print(json);
    }
  }
}
