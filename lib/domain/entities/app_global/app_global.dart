import 'dart:async';

import '../app_message/app_message.dart';
import '../failure/failure.dart';

enum AppFlavor { des, uat, prd }

class AppGlobal {
  final AppFlavor flavor;
  final String baseUrl;
  final StreamController<Failure?> streamError;
  final StreamController<AppMessage> streamMessage;
  final void Function() onDispose;

  static late AppGlobal _instance;

  static AppGlobal get instance => _instance;

  factory AppGlobal({
    required AppFlavor flavor,
    required String baseUrl,
    required StreamController<Failure?> streamError,
    required StreamController<AppMessage> streamMessage,
    required void Function() onDispose,
  }) {
    _instance = AppGlobal._internal(
      flavor,
      baseUrl,
      streamError,
      streamMessage,
      onDispose,
    );

    return _instance;
  }

  AppGlobal._internal(this.flavor, this.baseUrl, this.streamError,
      this.streamMessage, this.onDispose);
}
