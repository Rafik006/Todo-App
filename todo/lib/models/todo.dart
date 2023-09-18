class Todo {
  String? id;
  String? todoText;
  bool? isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone=false ,
  });
  static List<Todo> todoList(){
    return [
      Todo(id: "1", todoText: 'walk the dog',isDone: true),
      Todo(id: "2", todoText: 'Make lunch',isDone: true),
      Todo(id: "3", todoText: 'finish working on todo app'),
      Todo(id: "4", todoText: 'start working on tic tac app'),  
    ];
  }


}