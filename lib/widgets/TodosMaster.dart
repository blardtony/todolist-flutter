import 'package:flutter/material.dart';
import 'package:todolist/models/Todo.dart';

import 'TodoPreview.dart';

class TodosMaster extends StatefulWidget {
  TodosMaster({Key key, this.todos, this.selectedTodo}): super(key: key);

  final List<Todo> todos;
  final Function(Todo todo) selectedTodo;
  @override
  _MyTodosMasterState createState() =>  _MyTodosMasterState();
}

class _MyTodosMasterState extends State<TodosMaster>{

  void todoSelected (Todo todo) {
    setState(() {
      widget.selectedTodo(todo);
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todos.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoPreview(
            todo: widget.todos[index],
            onClick: todoSelected
        );
      }
    );
  }
}