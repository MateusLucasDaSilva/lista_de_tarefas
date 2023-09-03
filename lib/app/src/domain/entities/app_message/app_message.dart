import 'package:flutter/material.dart';

enum AppMessageType { alert, success }

extension AppMessageTypeExtension on AppMessageType {
  Color get backgroundColor =>
      this == AppMessageType.alert ? Colors.amber[900]! : Colors.teal;
}

class AppMessage {
  final String message;
  final AppMessageType type;

  AppMessage({
    required this.message,
    required this.type,
  });
}
