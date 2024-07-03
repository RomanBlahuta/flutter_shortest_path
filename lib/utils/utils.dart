import 'data_structures.dart';

List<Map<String, dynamic>> formResponseForPost(Map<String, List<Cell>> solutions) {
  final List<Map<String, dynamic>> response = [];
  for (final taskId in solutions.keys) {
    String pathString = formSolutionPathString(taskId, solutions);

    response.add({
      'id': taskId,
      'result': {
        'steps': solutions[taskId]?.map((solution) => ({'x': solution.item1, 'y': solution.item2})).toList(),
        'path': pathString,
      },
    });
  }

  return response;
}


String formSolutionPathString(String id, Map<String, List<Cell>> solutions) {
  String pathString = '';
  solutions[id]?.forEach((solution) {
    pathString += '(${solution.item1},${solution.item2})->';
  });
  pathString = pathString.substring(0, pathString.length-2);

  return pathString;
}
