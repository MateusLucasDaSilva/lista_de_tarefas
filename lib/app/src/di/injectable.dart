import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/failure/failure.dart';

import '../domain/entities/app_global/app_global.dart';
import '../domain/entities/app_message/app_message.dart';
import 'injectable.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> init() async {
  try {
    await Firebase.initializeApp();
    initAppGlobal();
    getIt.init();
  } catch (error) {
    rethrow;
  }
}

void initAppGlobal() {
  final StreamController<Failure?> streamError =
      StreamController<Failure?>.broadcast();
  final StreamController<AppMessage> streamMessage =
      StreamController<AppMessage>.broadcast();

  AppGlobal(
      flavor: AppFlavor.des,
      baseUrl: 'http://localhost:3000/api',
      streamError: streamError,
      streamMessage: streamMessage,
      onDispose: () {
        streamError.close();
        streamMessage.close();
      });
}
