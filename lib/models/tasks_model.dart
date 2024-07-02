import 'package:dio/dio.dart';

class CellModel {
  late int x;
  late int y;

  CellModel(this.x, this.y);
}


class TaskModel {
  late String id;
  late List<dynamic> field;
  late CellModel start;
  late CellModel end;

  TaskModel(this.id, this.field, this.start, this.end);
}


class TaskListModel {
  late bool error;
  late String message;
  late List<TaskModel> data = [];

  void fromJson(Response json) {
    error = json.data['error'];

    if (!error) {
      message = json.data['message'];

      for (final taskObj in json.data['data']) {
        data.add(
            TaskModel(
                taskObj['id'],
                taskObj['field'],
                CellModel(taskObj['start']['x'], taskObj['start']['y']),
                CellModel(taskObj['end']['x'], taskObj['end']['y'])
            )
        );
      }
    }
  }
}

