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
      body: SafeArea(
        child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SolutionGrid(
                field: extractField((state as AppLoaded)),
                xLen: extractField(state).first.length,
                yLen: extractField(state).length,
                path: state.solutions[state.currentId]!,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                formSolutionPathString(state.currentId, state.solutions),
              )
            ],
          );
        }),
      )
    );
  }
}

List<String> extractField(AppLoaded state) {
  int index = -1;
  for (final el in state.tasks.data) {
    if (el.id == state.currentId) {
      index = state.tasks.data.indexOf(el);
    }
  }
  if (index >= 0) {
    return List<String>.from(state.tasks.data[index].field);
  }
  else {
    return [];
  }
}