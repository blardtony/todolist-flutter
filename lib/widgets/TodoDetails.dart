import 'package:flutter/material.dart';
import 'package:todolist/models/Todo.dart';

class TodoDetails extends StatefulWidget {

  TodoDetails({Key key, this.todo, this.delete}): super(key: key);

  final Todo todo;
  final Function(Todo) delete;

  @override
  _TodoDetails createState() => _TodoDetails();
}

class _TodoDetails extends State<TodoDetails>{

  _modifyTodo() {

  }

  _deleteTodo() {
    widget.delete(widget.todo);
  }

  @override
  Widget build(BuildContext context) {
    return Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Titre de la tâche : ${widget.todo.title}"),
        Text("Description de la tâche : ${widget.todo.content}"),
        Text((widget.todo.done) ? "Tâche faite" : "Tâche non fait"),
        RaisedButton(
            color: Colors.orange,
            textColor: Colors.white,
            onPressed: (!widget.todo.done) ? _modifyTodo : null,
            child: Text("Modifier")
        ),
        RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            onPressed: (!widget.todo.done) ? null  : _deleteTodo,
            child: Text("Supprimer")
        )
      ],
    );
  }

}