import 'package:flutter/material.dart';
import 'package:todolist/widgets/pages/AllTodosPage.dart';
import 'package:todolist/widgets/pages/OneTodoPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AllTodosPage(),
        '/oneTodo': (context) => OneTodoPage()
      },
    );
  }
}