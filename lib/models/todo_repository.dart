import 'package:taskito/models/todo.dart';

abstract class TodoRepo {
  // get list of todos
  Future<List<Todo>> getTodo();

  // add a new todo
  Future<void> addTodo(Todo newTodo);

  // update an existing todo
  Future<void> updateTodo(Todo todo);

  // delete an todo
  Future<void> deleteTodo(Todo todo);
}
