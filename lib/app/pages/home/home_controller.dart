import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:lista_de_tarefas/app/models/tarefa_model.dart';
import 'package:lista_de_tarefas/app/repositories/tarefa/implements/tarefa_reporitory_impl.dart';

class HomeController extends ChangeNotifier {
  final _repository = TarefaReporitoryImpl();
  List<TarefaModel> _tarefas = [];

  Future<List<TarefaModel>> getAllTaks() async {
    _tarefas = await _repository.getAllTarefas();
    return _tarefas;
  }

  Future<void> save(TarefaModel tarefa) async {
    try {
      await _repository.save(tarefa);
      notifyListeners();
      log('Salvo com Sucesso');
    } on Exception catch (e, s) {
      log(e.toString());
      log(s.toString());
      log('Erro ao Salvar');
    }
  }

  Future<void> update(TarefaModel tarefa) async {
    try {
      await _repository.update(tarefa);
      notifyListeners();
      log('Atualizado com Sucesso');
    } on Exception catch (e, s) {
      log(e.toString());
      log(s.toString());
      log('Erro ao Atualizado');
    }
  }

  Future<void> delete(TarefaModel tarefa) async {
    try {
      _repository.delete(tarefa);
      notifyListeners();
      log('Excluido com Sucesso');
    } on Exception catch (e, s) {
      log(e.toString());
      log(s.toString());
      log('Erro ao Excluir');
    }
  }
}
