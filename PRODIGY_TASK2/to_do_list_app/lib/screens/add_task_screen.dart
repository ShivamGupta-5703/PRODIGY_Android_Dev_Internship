import 'package:flutter/material.dart';
import 'package:to_do_list_app/modules/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String newTaskTitle;

    return SingleChildScrollView(
      child: Container(
        color: Color(0XFF757575),
        child: Container(
          padding: EdgeInsets.only(top: 40, left: 30, right: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                autofocus: true, //automatically enabled
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter a New To-Do',
                  iconColor: Colors.lightBlueAccent,
                ),
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(fontSize: 18),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.lightBlueAccent),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(7),
                  fixedSize: MaterialStateProperty.all(Size.fromHeight(50)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
