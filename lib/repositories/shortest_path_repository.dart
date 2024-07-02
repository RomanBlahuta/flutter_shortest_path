import 'package:dio/dio.dart';
import 'package:webspark_test_task/models/tasks_model.dart';

class ShortestPathRepository {
  final Dio dio = Dio();

  Future<TaskListModel> getTasks() async {
    final response = await dio.get('');
    final result = TaskListModel();
    result.fromJson(response);
    return result;
  }
}