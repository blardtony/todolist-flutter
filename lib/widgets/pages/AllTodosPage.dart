import 'package:flutter/material.dart';
import 'package:todolist/models/Todo.dart';
import 'package:todolist/widgets/TodoDetails.dart';
import 'package:todolist/widgets/TodosMaster.dart';
import 'package:todolist/data/todos.dart' as data;

class AllTodosPage extends StatefulWidget {

  @override
  _AllTodoPageState createState() =>  _AllTodoPageState();

}

class _AllTodoPageState extends State<AllTodosPage> {

  TextEditingController  titleTask = TextEditingController();
  TextEditingController  contentTask = TextEditingController();

  _addTask() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Ajout une nouvelle tâche'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  TextField(
                      decoration: InputDecoration(
                          labelText: 'Entrez le nom de la tâche'
                      ),
                      controller: titleTask
                  ),
                  TextField(
                      decoration: InputDecoration(
                          labelText: 'Entrez la description de la tâche'
                      ),
                      controller: contentTask
                  ),
                ],
              ),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    setState(() {
                      Todo todo = new Todo(titleTask.value.text, contentTask.value.text);
                      data.todos.add(todo);
                      titleTask.clear();
                      contentTask.clear();
                      Navigator.pop(context);
                    });
                  },
                  child: Text('Ajouter')
              ),
              FlatButton(
                  onPressed: _close,
                  child: Text('Annuler')
              ),
            ],
          );
        }
    );
  }

  _close () {
    Navigator.pop(context);
  }


  Todo _selectedTodo;
  bool open = false;
  void _todoSelected(Todo todo) {
    this.open = true;
    setState(() {
      _selectedTodo = todo;
    });
  }

  _delete(Todo todo) {
    this.open= false;
    setState(() {
      data.todos.remove(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Todo List"),
      ),
      body: Container(

        margin: EdgeInsets.only(bottom: 80.0),

        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: TodosMaster(

                todos: data.todos,
                selectedTodo: _todoSelected,

              ),
            ),
            Expanded(

              flex: (_selectedTodo !=null) ? 1 : 0,
              child: (_selectedTodo !=null) ? TodoDetails(todo: _selectedTodo, delete: _delete,): Container(),

            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: _addTask,
        child: Icon(Icons.add),

      ),
    );
  }
}