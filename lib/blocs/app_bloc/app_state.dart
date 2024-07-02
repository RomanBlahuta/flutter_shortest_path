part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object?> get props => [];
}


final class AppInitial extends AppState {
  final String url = '';
  final int totalTasks = 0;
  final int tasksDone = 0;
  final TaskListModel tasks = TaskListModel();
  final Map<String, List<Cell>> solutions = {};
  final ResultsModel results = ResultsModel();
  final bool homeButtonActive = true;
  final bool calcButtonActive = true;
  final String currentId = '';

  AppInitial();

  @override
  List<Object?> get props => [url, totalTasks, tasksDone, tasks, solutions, results, homeButtonActive, calcButtonActive, currentId];
}


final class AppLoaded extends AppState {
  final String url;
  final int totalTasks;
  final int tasksDone;
  final TaskListModel tasks;
  final Map<String, List<Cell>> solutions;
  final ResultsModel results;
  final bool homeButtonActive;
  final bool calcButtonActive;
  final String currentId;

  const AppLoaded({
    required this.url,
    required this.totalTasks,
    required this.tasksDone,
    required this.tasks,
    required this.solutions,
    required this.results,
    required this.homeButtonActive,
    required this.calcButtonActive,
    required this.currentId,
  });

  @override
  List<Object?> get props => [url, totalTasks, tasksDone, tasks, solutions, results, homeButtonActive, calcButtonActive, currentId];
}
