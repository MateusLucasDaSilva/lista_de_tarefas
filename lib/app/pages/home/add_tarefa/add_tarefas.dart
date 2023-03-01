// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/core/ui/widgets/text_form_fild_custon.dart';
import 'package:lista_de_tarefas/app/repositories/tarefa/implements/tarefa_reporitory_impl.dart';
import 'package:provider/provider.dart';

import '../../../models/tarefa_model.dart';

class AddTarefas extends StatefulWidget {
  final TarefaModel? tarefa;
  const AddTarefas({
    Key? key,
    this.tarefa,
  }) : super(key: key);

  @override
  State<AddTarefas> createState() => _AddTarefasState();
}

class _AddTarefasState extends State<AddTarefas> {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final descripitonEC = TextEditingController();
  final situationEC = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameEC.dispose();
    descripitonEC.dispose();
    situationEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TarefaReporitoryImpl>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormFildCuston(controller: nameEC, label: 'Nome'),
                const SizedBox(
                  height: 20,
                ),
                TextFormFildCuston(
                    controller: descripitonEC, label: 'Descrição'),
                const SizedBox(
                  height: 20,
                ),
                TextFormFildCuston(controller: situationEC, label: 'situação'),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () async {
                          var formValid =
                              formKey.currentState?.validate() ?? false;
                          var message = 'Formulário Inválido';
                          if (formValid) {
                            Navigator.of(context).pop();
                            message = 'Tarefa Salva';
                          }
                          print(TarefaModel(
                              name: nameEC.text,
                              description: descripitonEC.text,
                              situation: situationEC.text,
                            ));
                          await controller.save(
                            TarefaModel(
                              name: nameEC.text,
                              description: descripitonEC.text,
                              situation: situationEC.text,
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                            ),
                          );
                        },
                        child: const Text('Salvar')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
