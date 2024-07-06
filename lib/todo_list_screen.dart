import 'package:flutter/material.dart';
import 'package:todo/add_new_todo_screen.dart';
import 'package:todo/edit_todo_screen.dart';
import 'package:todo/todo.dart';

class TodoListScreen extends StatefulWidget {
   const TodoListScreen({super.key});
 
   @override
   State<TodoListScreen> createState() => _TodoListScreenState();
 }
 
 class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todoList =[];
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: const Text('Todo List'),
       ),
       body: Visibility(
         visible: todoList.isNotEmpty,
         replacement: const Center(child: Text('Todo List Empty'),),
         child: ListView.separated(
           separatorBuilder: (context,index){
             return const Divider(color: Colors.grey,height: 12,indent: 10,);
           },
           itemCount: todoList.length,
           itemBuilder: (context,index){
             return buildTodoListTile(index);
          }),
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: _onTapAddTodoFAB,
         child: const Icon(Icons.add),
       ),
     );
   }

   ListTile buildTodoListTile(int index) {
     return ListTile(
             title: Text(todoList[index].title),
             subtitle: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(todoList[index].description),
                 Text(todoList[index].time.toString()),
               ],
             ),
             trailing: Wrap(
               children: [
                 IconButton(onPressed: ()=>_showDeleteConfirmationDialog(index), icon: const Icon(Icons.delete_forever_rounded)),
                 // edit button
                 IconButton(onPressed: ()=> _onTapUpdateTodo(index), icon: const Icon(Icons.edit_rounded))
               ],
             ),
          );
   }

   Future<void> _onTapUpdateTodo(int index) async {
     final Todo? updateTodo = await Navigator.push(context, MaterialPageRoute(builder: (context)=> EditTodoScreen(todo: todoList[index],)));
     if(updateTodo != null){
       todoList[index] = updateTodo;
       setState(() {});
     }
   }

   Future<void> _onTapAddTodoFAB() async {
     final Todo? result = await Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewTodoScreen()));
     if(result != null){
       todoList.add(result);

       setState(() {});
     }
   }


   void _showDeleteConfirmationDialog(int index){
     showDialog(context: context, builder: (context){
       return AlertDialog(
         title: const Text('Delete Todo'),
         content:  const Text('Are you sure you want to delete ?'),
         actions: [
           TextButton(onPressed: (){
             todoList.removeAt(index);
             Navigator.pop(context);
             setState(() {});
           },
           child: const Text('Yes, Delete',style: TextStyle(color: Colors.red),)),
           TextButton(onPressed: (){Navigator.pop(context);}, child: const Text('Cancel')),
         ],
       );
     });
   }
 }
 