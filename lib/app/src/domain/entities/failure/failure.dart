abstract class Failure {
  final String? message;

  Failure({this.message});
}

class GetTasksFailure extends Failure {
  GetTasksFailure({super.message});
}

class PostTaskFailure extends Failure {
  PostTaskFailure({super.message});
}

class DeleteTaskFailure extends Failure {
  DeleteTaskFailure({super.message});
}

class UpdateTaskFailure extends Failure {
  UpdateTaskFailure({super.message});
}
