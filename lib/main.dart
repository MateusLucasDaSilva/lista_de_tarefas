import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/src/presentation/app/app_widget.dart';

import 'app/src/di/injectable.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(AppWidget());
}
