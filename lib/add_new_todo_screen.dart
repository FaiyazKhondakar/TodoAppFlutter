import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key});

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10,20,10,0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleTEController,
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter You Title';
                  }
                },
                decoration: const InputDecoration(
                  hintText: 'Enter title',
                  label: Text('Title')
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: _descriptionTEController,
                validator: (String? value){
                  if(value?.trim().isEmpty ?? true){
                    return 'Enter You Description';
                  }
                },
                maxLength: 100,
                maxLines: 3,
                decoration: const InputDecoration(
                    hintText: 'Enter description',
                    label: Text('Description')
                )
              ),
              const SizedBox(height: 16,),
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  Todo todo = Todo(_titleTEController.text.trim(), _descriptionTEController.text.trim(), DateTime.now());
                  Navigator.pop(context, todo);
                }
              }, child: const Text('Add')))
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
