import 'package:flutter/material.dart';
import 'package:todolist/models/Todo.dart';

class TodoForm extends StatefulWidget {

  final Todo todo;

  TodoForm({Key key, this.todo}): super(key: key);

  @override
  _TodoFormState createState() =>  _TodoFormState();

}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController  titleTask = TextEditingController();
  TextEditingController  contentTask = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    titleTask.text = widget.todo.title;
    contentTask.text = widget.todo.content;
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Titre de la tâche'
            ),
            controller: titleTask,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Description de la tâche'
            ),
            controller: contentTask,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                      setState(() {
                        widget.todo.title = titleTask.text;
                        widget.todo.content = contentTask.text;

                      });
                  Navigator.pushNamed(context, '/');
                }else {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(
                        content: Text('Invalid Data'),
                        backgroundColor: Colors.red,
                  ));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}