import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_bloc/app_bloc.dart';

class CalculationScreen extends StatelessWidget {
  const CalculationScreen({super.key});

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
            'Process screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Positioned.fill(
                bottom: 16,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
                      if ((state as AppLoaded).tasksDone == state.totalTasks) {
                        return OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(side: const BorderSide(
                                color: Colors.lightBlue,
                                width: 2,
                                style: BorderStyle.solid
                            ),
                                borderRadius: BorderRadius.circular(14)
                            ),
                            backgroundColor: ((state as AppLoaded).calcButtonActive) ? Colors.lightBlueAccent : Colors.grey,
                          ),
                          onPressed: (state.calcButtonActive) ? () => Navigator.pushNamed(context, 'solutions') : null,
                          child: const Text(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              'Send results to server'
                          ),
                        );
                      }
                      else {
                        return Container();
                      }
                    }),
                  ),
                ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                    child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
                      if ((state as AppLoaded).totalTasks > state.tasksDone) {
                        return const Text(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          'Calculating...',
                        );
                      }
                      else {
                        return const Text(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          'All calculations have finished, you can send your results to server',
                        );
                      }
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 64),
                    child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
                      return Text(
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          '${((state as AppLoaded).totalTasks == 0 || state.tasksDone == 0) ? 0 : ((state.tasksDone / state.totalTasks)*100).round()}%');
                    }),
                  ),
                  Transform.scale(
                    scale: 3,
                    child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
                        return Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.lightBlue,
                            value: (state as AppLoaded).tasksDone / (state).totalTasks,
                            semanticsLabel: 'Circular progress indicator',
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                    width: 100,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
