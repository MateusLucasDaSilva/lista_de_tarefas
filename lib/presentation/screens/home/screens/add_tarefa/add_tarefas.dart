// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/domain/entities/routes/routes.dart';
import 'package:lista_de_tarefas/domain/entities/task/task_entity.dart';
import 'package:lista_de_tarefas/presentation/shared/custom_text_form_fild/text_form_fild_custon.dart';
import 'package:lista_de_tarefas/presentation/shared/loader/louder_extension.dart';

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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameEC = TextEditingController();
  final TextEditingController descriptionEC = TextEditingController();
  final TextEditingController situationEC = TextEditingController();
  Function(TaskEntity task)? addTaskCallBack;

  @override
  void initState() {
    super.initState();
  }

  void submitTask() {
    showLoader(context);
    final bool formValid = formKey.currentState?.validate() ?? false;
    if (!formValid) {
      return;
    }
    final TaskEntity task = TaskEntity(
      name: nameEC.text,
      description: descriptionEC.text,
      situation: situationEC.text,
      createdAt: DateTime.now(),
      dateTime: DateTime.now().add(const Duration(minutes: 5)),
    );

    addTaskCallBack?.call(task);
    Navigator.of(context).popAndPushNamed(NamedRoutes.home.route);
    hideLoader(context);
  }

  @override
  void dispose() {
    nameEC.dispose();
    descriptionEC.dispose();
    situationEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    addTaskCallBack =
        ModalRoute.of(context)!.settings.arguments as Function(TaskEntity)?;
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
                TextFormFieldCustom(controller: nameEC, label: 'Nome'),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldCustom(
                    controller: descriptionEC, label: 'Descrição'),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldCustom(controller: situationEC, label: 'situação'),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () => submitTask(),
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
