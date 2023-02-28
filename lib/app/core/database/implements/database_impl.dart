import 'package:lista_de_tarefas/app/core/database/database.dart';
import 'package:lista_de_tarefas/app/models/tarefa_model.dart';

class DatabaseImpl implements Database {
  @override
  Future<List<TarefaModel>> getAllTarefas() async {
    return [
      TarefaModel(
          name: 'Caminhar',
          description: 'caminhar de tarde',
          situation: 'Ativa'),
      TarefaModel(
          name: 'Estudar',
          description: 'Estudar de manhã',
          situation: 'Concluida'),
      TarefaModel(
          name: 'Jogar', description: 'Jogar a noite', situation: 'Pendente'),
    ];
  }
}
