import '../../models/tarefa_model.dart';

abstract class Database {

  Future<List<TarefaModel>> getAllTarefas(); 

  
}
