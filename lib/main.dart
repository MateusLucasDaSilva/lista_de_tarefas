import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/presentation/app/app_widget.dart';

import 'di/injectable.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(AppWidget());
}
