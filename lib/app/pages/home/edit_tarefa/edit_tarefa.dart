// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/pages/home/home_controller.dart';
import 'package:lista_de_tarefas/app/src/domain/entities/task/task_entity.dart';
import 'package:lista_de_tarefas/app/src/presentation/shared/custom_text_form_fild/text_form_fild_custon.dart';
import 'package:provider/provider.dart';

import '../../../src/presentation/shared/loader/louder_extension.dart';

class EditTarefa extends StatefulWidget {
  const EditTarefa({
    Key? key,
  }) : super(key: key);

  @override
  State<EditTarefa> createState() => _EditTarefaState();
}

class _EditTarefaState extends State<EditTarefa> with LoaderExtension {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tarefa = ModalRoute.of(context)!.settings.arguments as TaskEntity;
    final formKey = GlobalKey<FormState>();
    final nameEC = TextEditingController(text: tarefa.name);
    final descripitonEC = TextEditingController(text: tarefa.description);
    final situationEC = TextEditingController(text: tarefa.situation);
    final controller = Provider.of<HomeController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormFildCuston(
                  controller: nameEC,
                  label: 'Nome',
                  initialValue: nameEC.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFildCuston(
                  controller: descripitonEC,
                  label: 'Descrição',
                  initialValue: descripitonEC.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFildCuston(
                  controller: situationEC,
                  label: 'situação',
                  initialValue: situationEC.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () async {
                      hideLoader(context);
                      var formValid = formKey.currentState?.validate() ?? false;
                      var message = 'Formulário Inválido';
                      if (formValid) {
                        await controller.update(TaskEntity(
                          id: tarefa.id,
                          name: nameEC.text,
                          description: descripitonEC.text,
                          situation: situationEC.text,
                        ));
                        showLoader(context);
                        Navigator.of(context).popAndPushNamed('/home');
                        message = 'Tarefa Salva';
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                        ),
                      );
                    },
                    child: const Text('Salvar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
