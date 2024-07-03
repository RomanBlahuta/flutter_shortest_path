import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test_task/blocs/app_bloc/app_bloc.dart';

import '../utils/utils.dart';

class SolutionListScreen extends StatelessWidget {
  const SolutionListScreen({super.key});

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
            'Result list screen'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
            return ListView(
              children: (state as AppLoaded).solutions.keys.map((id) => GestureDetector(
                onTap: () {
                  context.read<AppBloc>().add(SetCurrentSolutionIdEvent(id));
                  Navigator.pushNamed(context, 'solution');
                } ,
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            width: 2,
                            color: Colors.black12,
                          )
                      )
                  ),
                  height: 72,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      formSolutionPathString(id, state.solutions),
                    ),
                  ),
                ),
              )).toList(),
            );
          }),
        ),
      )
    );
  }
}
