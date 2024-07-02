import 'package:flutter/cupertino.dart';
import 'package:webspark_test_task/utils/data_structures.dart';

class SolutionGrid extends StatelessWidget {
  final List<String> field;
  final List<Cell> path;
  final int xLen;
  final int yLen;

  const SolutionGrid({super.key, required this.field, required this.xLen, required this.yLen, required this.path});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //
      ],
    );
  }
}