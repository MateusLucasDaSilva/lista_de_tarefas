// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/pages/home/home_controller.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/task/task_entity.dart';
import 'package:lista_de_tarefas/app/src/presentation/shared/custom_text_form_fild/text_form_fild_custon.dart';
import 'package:lista_de_tarefas/app/src/presentation/shared/loader/louder_extension.dart';
import 'package:provider/provider.dart';

class AddTarefas extends StatefulWidget {
  final TaskEntity? tarefa;
  const AddTarefas({
    Key? key,
    this.tarefa,
  }) : super(key: key);

  @override
  State<AddTarefas> createState() => _AddTarefasState();
}

class _AddTarefasState extends State<AddTarefas> with LoaderExtension {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final descripitonEC = TextEditingController();
  final situationEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    descripitonEC.dispose();
    situationEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);

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
                          showLoader(context);
                          var formValid =
                              formKey.currentState?.validate() ?? false;
                          var message = 'Formulário Inválido';
                          if (formValid) {
                            await controller.save(
                              TaskEntity(
                                name: nameEC.text,
                                description: descripitonEC.text,
                                situation: situationEC.text,
                              ),
                            );
                            hideLoader(context);

                            Navigator.of(context).popAndPushNamed('/home');
                            message = 'Tarefa Salva';
                          }
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
