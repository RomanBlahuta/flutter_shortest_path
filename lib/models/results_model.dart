import 'package:dio/dio.dart';

class ResultModel {
  late String id;
  late bool correct;

  ResultModel(this.id, this.correct);
}


class ResultsModel {
  late bool error;
  late String message;
  late List<ResultModel> data = [];

  void fromJson(Response json) {
    error = json.data['error'];

    if (!error) {
      message = json.data['message'];

      for (final resultObj in json.data['data']) {
        data.add(ResultModel(resultObj['id'], resultObj['correct']));
      }
    }
  }
}