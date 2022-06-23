

import 'package:todos/domain/task.dart';
import 'package:todos/domain/task_repository.dart';

class FakeRepository extends TaskRepository {

  List<Task> tasks = [
    Task(id: 1, text: "Sprint 1", category: "Processo de software", deadline: DateTime(2022, 06, 23, 23, 59)),
    Task(id: 2, text: "Regressão Linear", category: "Bioestatística", deadline: DateTime(2022, 06, 30, 18, 00)),
    Task(id: 3, text: "Segunda avaliação", category: "Bioestatística", deadline: DateTime(2022, 07, 01, 10, 30)),
    Task(id: 4, text: "Criação do sile com HTML + CSS", category: "Desenvolvimento Web", deadline: DateTime(2022, 07, 02, 23, 00)),
    Task(id: 5, text: "Primeira prova", category: "Desenvolvimento Web", deadline: DateTime(2022, 07, 10, 11, 00))
  ];

  @override
  Future<int?> create(String text) {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAll() {
    return Future.delayed(Duration(milliseconds: 100), () => this.tasks);
  }

  @override
  Future<Task?> update(int id, bool status) {
    Task? changedTask;
    tasks.forEach((element) {
      if(element.id == id) { changedTask = element; }
    });

    changedTask?.done = status;
    return Future.delayed(Duration(milliseconds: 100), () => changedTask);
  }
}