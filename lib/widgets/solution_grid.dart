import 'package:flutter/material.dart';
import 'package:webspark_test_task/utils/constants.dart';
import 'package:webspark_test_task/utils/data_structures.dart';

class SolutionGrid extends StatelessWidget {
  final List<String> field;
  final List<Cell> path;
  final int xLen;
  final int yLen;

  const SolutionGrid({super.key, required this.field, required this.xLen, required this.yLen, required this.path});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: getRows(context, field, path, xLen, yLen),
    );
  }
}


List<Widget> getRows(BuildContext context, List<String> field, List<Cell> path, int xLen, int yLen) {
  final result = <Widget>[];

  for (int y = 0; y < yLen; y++) {
    final rowCells = <Widget>[];

    for (int x = 0; x < xLen; x++) {
      rowCells.add(
        Container(
          width: MediaQuery.of(context).size.width / xLen,
          height: MediaQuery.of(context).size.width / yLen,
          decoration: BoxDecoration(
            color: getCellColor(field, path, x, y),
            border: Border.all(color: Colors.black, width: 1, style: BorderStyle.solid, strokeAlign: BorderSide.strokeAlignCenter),
          ),
          child: Center(
            child: Text(
                style: TextStyle(
                  fontSize: 16,
                  color: (getCellColor(field, path, x, y) == Colors.black) ? Colors.white : Colors.black,
                ),
                '($x,$y)'),
          ),
        )
      );
    }

    result.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: rowCells,
        )
    );
  }

  return result;
}

Color getCellColor(List<String> field, List<Cell> path, int x, int y) {
  bool isInPath = false;
  path.forEach((cell) => (cell.item1 == x && cell.item2 == y) ? isInPath = true : null);

  if (field[y][x] == OBSTACLE) {
    return Colors.black;
  }
  else if (path.first.item1 == x && path.first.item2 == y) {
    return const Color(0xff64ffda);
  }
  else if (path.last.item1 == x && path.last.item2 == y) {
    return const Color(0xff009688);
  }
  else if (isInPath) {
    return const Color(0xff4caf50);
  }
  return Colors.white;
}
