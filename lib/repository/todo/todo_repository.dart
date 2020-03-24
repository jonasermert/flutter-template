import 'package:flutter/cupertino.dart';
import 'package:flutter_template/database/todo/todo_dao_storing.dart';
import 'package:flutter_template/model/webservice/todo/todo.dart';
import 'package:flutter_template/model/database/todo/db_todo_table.dart';
import 'package:flutter_template/repository/todo/todo_repo.dart';
import 'package:flutter_template/webservice/todo/todo_service.dart';

class TodoRepository extends TodoRepo {
  final TodoDaoStoring _todoDao;
  final TodoService _userService;

  TodoRepository(this._userService, this._todoDao);

  @override
  Stream<List<Todo>> getTodos() => _todoDao.getAllTodosStream().map((list) => list.map((item) => item.getModel()).toList());

  /**
   * Get Users will be requested from
   * https://jsonplaceholder.typicode.com/todos
   */
  @override
  Future<List<Todo>> fetchTodos() async {
    final results = await _userService.getTodos();
    for (final todo in results) {
      await _todoDao.createBackendTodo(todo);
    }
    return results;
  }

  @override
  Future<void> saveTodo(String todo) async {
    await _todoDao.createTodo(todo);
  }

  @override
  Future<void> setTodoState({@required int id, @required bool value}) async {
    await _todoDao.setTodoState(id: id, value: value);
  }
}
