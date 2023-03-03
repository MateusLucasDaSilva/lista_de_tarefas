import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/models/tarefa_model.dart';
import 'package:lista_de_tarefas/app/pages/home/home_controller.dart';
import 'package:lista_de_tarefas/app/pages/home/widget/tarefa_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TarefaModel> _tarefas = [];
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getAllTaks().then(
          (list) => setState(() {
            _tarefas = list;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    context.read<HomeController>().getAllTaks().then((value) => setState(
          () {
            _tarefas = value;
          },
        ));

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
                  id: _tarefas[index].id,
                  name: _tarefas[index].name,
                  description: _tarefas[index].description,
                  situation: _tarefas[index].situation,
                ))),
      ),
    );
  }
}
