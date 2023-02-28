import 'package:lista_de_tarefas/app/models/tarefa_model.dart';

abstract class TarefaReporitory {
Future<List<TarefaModel>> getAllTarefas();
}