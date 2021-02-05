import 'package:flutter/material.dart';
import 'package:todolist/models/Todo.dart';

class TodoPreview extends StatefulWidget {

  TodoPreview({Key key, this.todo, this.onClick}): super(key: key);

  final Todo todo;
  final Function(Todo) onClick;

  @override
  _TodoPreview createState() => _TodoPreview();
}

class _TodoPreview extends State<TodoPreview>{

  _getStyle() {
    return (widget.todo.done) ? TextStyle(color:Colors.grey[600], decoration: TextDecoration.lineThrough) :  TextStyle(color:Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Row(

      children: <Widget>[
        Expanded(
            flex: 3,
            child: CheckboxListTile(
              title: Text(
                '${widget.todo.title}',
                style: _getStyle(),
              ),
              subtitle: Text(
                '${widget.todo.content}',
                style: _getStyle(),
              ),
              value: widget.todo.done,
              activeColor: Colors.green[400],
              checkColor: Colors.white,
              onChanged: (bool value) {
                setState(() {
                  widget.todo.done = value;
                });
              },
            ),
        ),
        Expanded(
          flex: 1,
          child: Padding(

            padding: EdgeInsets.only(right: 16.0),
            child: RaisedButton(
                color: Colors.teal,
                textColor: Colors.white,
                onPressed: () => widget.onClick(widget.todo),
                child: Text("Détails")
            ),
          )
        )
      ],
    );
  }

}