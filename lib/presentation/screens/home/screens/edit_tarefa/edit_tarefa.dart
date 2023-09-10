// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/domain/entities/routes/routes.dart';
import 'package:lista_de_tarefas/domain/entities/task/task_entity.dart';
import 'package:lista_de_tarefas/presentation/shared/custom_text_form_fild/text_form_fild_custon.dart';
import 'package:lista_de_tarefas/presentation/shared/loader/louder_extension.dart';

class EditTarefa extends StatefulWidget {
  const EditTarefa({
    super.key,
  });

  @override
  State<EditTarefa> createState() => _EditTarefaState();
}

class _EditTarefaState extends State<EditTarefa> with LoaderExtension {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameEC = TextEditingController();
  final TextEditingController descriptionEC = TextEditingController();
  final TextEditingController situationEC = TextEditingController();

  late TaskEntity task;
  Function(TaskEntity)? editeTaskCallback;
  late Map<String, dynamic> arguments;
  String? get taskId => task.id;

  @override
  void dispose() {
    nameEC.dispose();
    descriptionEC.dispose();
    situationEC.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    recoverArguments();
  }

  void recoverArguments() {
    arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    task = arguments['task'];
    editeTaskCallback = arguments['callback'];
    setValueTextControllers(task);
  }

  void setValueTextControllers(TaskEntity task) {
    nameEC.text = task.name;
    situationEC.text = task.situation;
    descriptionEC.text = task.situation;
  }

  void submitUpdate() {
    final bool formValid = formKey.currentState?.validate() ?? false;
    if (!formValid) {
      return;
    }
    final TaskEntity task = TaskEntity(
      id: taskId,
      name: nameEC.text,
      description: descriptionEC.text,
      situation: situationEC.text,
      dateTime: DateTime.now().add(const Duration(minutes: 5)),
    );

    editeTaskCallback?.call(task);
    Navigator.of(context).popAndPushNamed(NamedRoutes.home.route);
  }

  @override
  Widget build(BuildContext context) {
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
                TextFormFieldCustom(
                  controller: nameEC,
                  label: 'Nome',
                  initialValue: nameEC.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldCustom(
                  controller: descriptionEC,
                  label: 'Descrição',
                  initialValue: descriptionEC.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldCustom(
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
                    onPressed: () => submitUpdate(),
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
