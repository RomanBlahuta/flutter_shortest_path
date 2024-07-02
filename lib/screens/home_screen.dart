import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_test_task/models/tasks_model.dart';
import 'package:webspark_test_task/repositories/shortest_path_repository.dart';

import '../blocs/app_bloc/app_bloc.dart';

// https://flutter.webspark.dev/flutter/api
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
        action: SnackBarAction(label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

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
            'Home screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                        if (state is AppInitial) {
                          return OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(side: const BorderSide(
                                  color: Colors.lightBlue,
                                  width: 2,
                                  style: BorderStyle.solid
                              ),
                                  borderRadius: BorderRadius.circular(14)
                              ),
                              backgroundColor: Colors.lightBlueAccent,
                            ),
                            onPressed: ((state as AppInitial).homeButtonActive) ? () async {
                              context.read<AppBloc>().add(const ToggleHomeButtonEvent(false));
                              final repository = ShortestPathRepository();
                              final response = await repository.getTasks(state.url);
                              if (response.error) {
                                _showToast(context, response.message);
                              }
                              else {
                                Navigator.pushNamed(context, 'calculation');
                              }
                              context.read<AppBloc>().add(const ToggleHomeButtonEvent(true));
                              context.read<AppBloc>().add(TasksLoadedEvent(response));
                            } : null,
                            child: const Text(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                'Start counting process'
                            ),
                          );
                        }
                        else {
                          return OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(side: const BorderSide(
                                  color: Colors.lightBlue,
                                  width: 2,
                                  style: BorderStyle.solid
                              ),
                                  borderRadius: BorderRadius.circular(14)
                              ),
                              backgroundColor: ((state as AppLoaded).homeButtonActive) ? Colors.lightBlueAccent : Colors.grey,
                            ),
                            onPressed: (state.homeButtonActive) ? () async {
                              context.read<AppBloc>().add(const ToggleHomeButtonEvent(false));
                              final repository = ShortestPathRepository();
                              final response = await repository.getTasks(state.url);
                              if (response.error) {
                                _showToast(context, response.message);
                              }
                              else {
                                Navigator.pushNamed(context, 'calculation');
                              }
                              context.read<AppBloc>().add(const ToggleHomeButtonEvent(true));
                              context.read<AppBloc>().add(TasksLoadedEvent(response));
                            } : null,
                            child: const Text(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                                'Start counting process'
                            ),
                          );
                        }
                      }),
                    ),
                ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 16),
                  child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
                    if (state is AppLoaded) {
                      return Text(
                        'Set valid API base URL in order to continue - ${state.url}',
                      );
                    }
                    else {
                      return Text(
                        'Set valid API base URL in order to continue',
                      );
                    }
                  })
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.sync_alt,
                      size: 18,
                    ),
                    Container(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (text) => context.read<AppBloc>().add(EnterUrlEvent(text)),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Enter URL',
                          )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
