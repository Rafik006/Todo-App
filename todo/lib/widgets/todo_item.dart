import 'package:flutter/material.dart';
import 'package:todo/constants/Colors.dart';
import 'package:todo/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final completeTodo;
  final deleteTodo;
  const TodoItem({super.key,required this.todo,required this.completeTodo,required this.deleteTodo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      onTap: () {
        completeTodo(todo);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tileColor: Colors.white,
      leading: Icon(todo.isDone!?Icons.check_box:Icons.check_box_outline_blank,color:TdBlue),
      title: Text(todo.todoText!,style: TextStyle(
        color: TdBlack,
        fontSize: 16,
        decoration: todo.isDone!?TextDecoration.lineThrough:null,
      ),),
      trailing: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.symmetric(vertical: 12),
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: TdRed,

        ),
        child: IconButton(
          onPressed: (){
            deleteTodo(todo.id);
          },
          color: Colors.white,
          iconSize: 18,
          icon: Icon(Icons.delete),
        ),
      ),
    ));
  }
}
