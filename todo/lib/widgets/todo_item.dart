import 'package:flutter/material.dart';
import 'package:todo/constants/Colors.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListTile(
      onTap: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tileColor: Colors.white,
      leading: Icon(Icons.check_box,color:TdBlue),
      title: Text("watch football game "),
      trailing: Container(
        width: 50,
        child: Icon(Icons.delete,color: Colors.white,),
        color: Colors.red,
      ),
    ));
  }
}
