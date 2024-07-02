import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test_task/blocs/app_bloc/app_bloc.dart';
import 'package:webspark_test_task/widgets/solution_grid.dart';

import '../utils/utils.dart';

class SolutionViewScreen extends StatelessWidget {
  const SolutionViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.lightBlue,
        title: const Text(
            style: TextStyle(
              color: Colors.white,
            ),
            'Preview screen'
        ),
      ),
      body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SolutionGrid(field: [], xLen: 0, yLen: 0, path: []),
            const SizedBox(
              height: 16,
            ),
            Text(
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              formSolutionPathString((state as AppLoaded).currentId, state.solutions),
            )
          ],
        );
      }),
    );
  }
}
