// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/app/core/ui/widgets/text_form_fild_custon.dart';
import 'package:lista_de_tarefas/app/models/tarefa_model.dart';
import 'package:lista_de_tarefas/app/pages/home/home_controller.dart';
import 'package:provider/provider.dart';

class EditTarefa extends StatefulWidget {
  const EditTarefa({
    Key? key,
  }) : super(key: key);

  @override
  State<EditTarefa> createState() => _EditTarefaState();
}

class _EditTarefaState extends State<EditTarefa> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tarefa = ModalRoute.of(context)!.settings.arguments as TarefaModel;
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
                      var formValid = formKey.currentState?.validate() ?? false;
                      var message = 'Formulário Inválido';
                      if (formValid) {
                        await controller.update(TarefaModel(
                          id: tarefa.id,
                          name: nameEC.text,
                          description: descripitonEC.text,
                          situation: situationEC.text,
                        ));
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
