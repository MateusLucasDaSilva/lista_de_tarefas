enum NamedRoutes {
  splash('/'),
  home('/home'),
  editTask('/home/edit_tarefa'),
  addTask('/home/add_tarefas');

  final String route;
  const NamedRoutes(this.route);
}
