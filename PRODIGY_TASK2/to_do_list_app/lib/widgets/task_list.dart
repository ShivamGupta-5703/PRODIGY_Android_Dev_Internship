import 'package:flutter/material.dart';
import 'package:to_do_list_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/modules/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //consumer widget will listen to changes made to task data,when change made it will rebuild entire listview with updated tasks.
    return Consumer<TaskData>(
      builder: (context, TaskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskText: TaskData.tasks[index].text,
              isChecked: TaskData.tasks[index].isDone,
              checkBoxCallBack: (bool? checkBoxState) {
                TaskData.updateTask(TaskData.tasks[index]);
              },
              longPressCallback: () {
                TaskData.deleteTask(TaskData.tasks[index]);
              },
            );
          },
          itemCount: TaskData.taskCount,
        );
      },
    );
  }
}

//This code is also fine, but since are repeating of provider.of , we can instead use a consumer widget of type taskdata
// return ListView.builder(
// itemBuilder: (context, index) {
// return TaskTile(
// taskText: Provider.of<TaskData>(context).tasks[index].text,
// isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
// checkBoxCallBack: (bool? checkBoxState) {
// // setState(() {
// //   Provider.of<TaskData>(context).tasks[index].toggleDone();
// // });
// });
// },
// itemCount: Provider.of<TaskData>(context).tasks.length,
// );
