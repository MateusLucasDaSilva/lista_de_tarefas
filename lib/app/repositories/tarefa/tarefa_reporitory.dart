import 'package:lista_de_tarefas/app/models/tarefa_model.dart';

abstract class TarefaReporitory {

Future<List<TarefaModel>> getAllTarefas();


Future<void> save(TarefaModel tarefa);


Future<void> update(TarefaModel tarefa);

Future<void> delete(TarefaModel tarefa);




}