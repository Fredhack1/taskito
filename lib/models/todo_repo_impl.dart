import 'package:taskito/models/todo.dart';
import 'package:taskito/models/todo_repository.dart';

class TodoRepoImpl implements TodoRepo {
  // Exemple de données locales ou d'une source de données
  List<Todo> _todos = [];

  @override
  Future<List<Todo>> getTodo() async {
    // Simuler une récupération de données avec un délai
    await Future.delayed(const Duration(seconds: 1));
    return _todos;
  }

  @override
  Future<void> addTodo(Todo newTodo) async {
    await Future.delayed(const Duration(seconds: 1));
    _todos.add(newTodo);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    await Future.delayed(const Duration(seconds: 1));
    int index = _todos.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      _todos[index] = todo;
    }
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await Future.delayed(const Duration(seconds: 1));
    _todos.removeWhere((t) => t.id == todo.id);
  }
}
