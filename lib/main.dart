import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/todo_list_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TodoListApp());
}
