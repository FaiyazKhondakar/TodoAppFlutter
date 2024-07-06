import 'package:flutter/material.dart';
import 'package:todo/todo_list_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const TodoListScreen(),
      theme: ThemeData(
        inputDecorationTheme:const InputDecorationTheme(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
            ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            padding: const EdgeInsets.fromLTRB(25, 3, 25, 3)
          ),
        )
      ),
    );
  }
}
