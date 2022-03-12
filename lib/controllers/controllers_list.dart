import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo_app/controllers/create_or_edit_task_state.dart'; 
import 'package:todo_app/controllers/todo_state.dart';

//? baktığım videoda SingleChildClonebleWidget kullanılmış SingleChildWidget yerine farkı tam olarak ne ? video =>  https://youtu.be/kcnygitJDt8?t=547
List<SingleChildWidget> controllerList = [ 
  ChangeNotifierProvider<TodoState>(create: (_) => TodoState()),
  ChangeNotifierProvider<CreateOrEditTaskState>(create: (_) => CreateOrEditTaskState()),
];