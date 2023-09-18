import 'package:flutter/material.dart';
import 'package:todo/constants/Colors.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = Todo.todoList();
  List <Todo> _foundTodo=[];
  final _todoController = TextEditingController();
  final _searchBarController=TextEditingController();
  final _focusNode = FocusNode();
  @override
  void initState() {
    _foundTodo=todosList;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: TdWhite,
        appBar: NavBar(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                children: [
                  SearchBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: Text(
                            "All Todos",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        for (Todo todo in _foundTodo.reversed)
                          TodoItem(
                              todo: todo,
                              completeTodo: _handleTodoChange,
                              deleteTodo: _handleDeleteTodo),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              child: Align(
                alignment: Alignment.bottomCenter,
                
                child: Row(
                  
                  children: [
                    Expanded(
                    
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 10.0,
                                spreadRadius: 0.0)
                          ],
                        ),
                        child:  TextField(
                          focusNode: _focusNode,
                          controller: _todoController,
                          decoration: InputDecoration(
                              hintText: "Add a new todo",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20),
                      child: ElevatedButton(
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 40),
                        ),
                        onPressed: () {
                          _handleAddTodo(_todoController.text);
                        },
                        style: ElevatedButton.styleFrom(primary: TdBlue),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone!;
    });
  }

  void _handleDeleteTodo(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }
  void _handleAddTodo(String todo){
    
   if(todo!=""){
     setState(() {
      _foundTodo.add(Todo(id: DateTime.now().millisecond.toString(), todoText:todo));
    });
    _todoController.clear();
    _focusNode.unfocus();
    _searchBarController.clear();
   }
    
  }
  void _handleTodoFilter(String query){
    List<Todo> result=[];
    if(query.isEmpty){
      result=todosList;
    }else{
      result=todosList.where((item) => item.todoText!.toLowerCase().contains(query.toLowerCase())).toList();
    }
    setState(() {
      _foundTodo=result;
    });

  }

  Container SearchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child:  TextField(
        controller: _searchBarController,
        onChanged: (value) => _handleTodoFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            prefixIcon: Icon(
              Icons.search,
              color: TdBlack,
              size: 25,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 25, maxWidth: 30),
            hintText: "Search",
            hintStyle: TextStyle(color: TdGrey, fontSize: 18),
            border: InputBorder.none),
      ),
    );
  }

  AppBar NavBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: TdWhite,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: TdBlack,
          ),
          Container(
            width: 40,
            height: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/Rafik.jpg",
                )),
          )
        ],
      ),
      centerTitle: true,
    );
  }
}
