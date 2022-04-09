import 'package:todo_app/core/enums/sort_task_by.dart';

//? isimlendirme
//? bunu kullanmak mantıklı mı?
class MainPageTaskListSelectorValuesModel{
  int taskListLenght;
  TaskSortingType taskSortingType;
  MainPageTaskListSelectorValuesModel(this.taskListLenght,this.taskSortingType);
}