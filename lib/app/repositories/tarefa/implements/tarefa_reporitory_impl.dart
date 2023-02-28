import 'package:lista_de_tarefas/app/core/database/implements/database_impl.dart';
import 'package:lista_de_tarefas/app/models/tarefa_model.dart';

import '../tarefa_reporitory.dart';

class TarefaReporitoryImpl implements TarefaReporitory {
  @override
  
  Future<List<TarefaModel>> getAllTarefas() async {
    return  await DatabaseImpl().getAllTarefas();
  }

}