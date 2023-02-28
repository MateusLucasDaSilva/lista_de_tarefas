import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/models/tarefa_model.dart';
import 'package:lista_de_tarefas/app/pages/home/widget/tarefa_widget.dart';
import 'package:lista_de_tarefas/app/repositories/tarefa/implements/tarefa_reporitory_impl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TarefaModel> _tarefas = [];
  var _help = TarefaReporitoryImpl();

  Future<List<TarefaModel>> _getTarefas(BuildContext context) async {
    var controller = Provider.of<TarefaReporitoryImpl>(context);
    var tarefas = await controller.getAllTarefas();
    return tarefas;
  }

  @override
  void initState() {
    super.initState();
    _help.getAllTarefas().then(
          (list) => setState(() {
            _tarefas = list;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/add_tarefas');
              },
              icon: const Icon(Icons.add_task))
        ],
        title: const Text(
          'Lista de Tarefas',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: _tarefas.length,
            itemBuilder: (context, index) => TarefaWidget(
                    tarefa: TarefaModel(
                  name: _tarefas[index].name,
                  description: _tarefas[index].description,
                  situation: _tarefas[index].situation,
                ))),
      ),
    );
  }
}
