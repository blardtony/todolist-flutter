import 'package:flutter/material.dart';
import 'package:todolist/models/Todo.dart';
import 'package:todolist/widgets/TodoForm.dart';

class OneTodoPage extends StatefulWidget {

  final Todo todo;

  OneTodoPage({Key key, this.todo}): super(key: key);

  @override
  _OneTodoPageState createState() =>  _OneTodoPageState();

}

class _OneTodoPageState extends State<OneTodoPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Modifier tâche : ${widget.todo.title}"),
    ),
    body: Container(
      child: TodoForm(todo: widget.todo),
    )
    );
  }
}