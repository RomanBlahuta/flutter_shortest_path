import 'package:dio/dio.dart';
import 'package:webspark_test_task/models/results_model.dart';
import 'package:webspark_test_task/models/tasks_model.dart';

class ShortestPathRepository {
  final Dio dio = Dio();

  Future<TaskListModel> getTasks(String url) async {
    late TaskListModel result;
    try {
      final response = await dio.get(url);
      print(response);
      result = TaskListModel();
      result.fromJson(response);
    } catch (e) {
      result = TaskListModel();
      print('\n\n\nCAUGHT\n\n\n');
      result.error = true;
      result.message = 'Unknown Error: Most Likely an invalid URL was provided';
      result.data = [];
    }
    return result;
  }

  Future<ResultsModel> postSolutions(String url, List<Map<String, dynamic>> answers) async {
    final response = await dio.post(url, data: answers);
    final result = ResultsModel();
    result.fromJson(response);
    return result;
  }
}
