part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}


class EnterUrlEvent extends AppEvent {
  final String url;

  const EnterUrlEvent(this.url);

  @override
  List<Object?> get props => [url];
}


class TasksLoadedEvent extends AppEvent {
  final TaskListModel tasks;

  const TasksLoadedEvent(this.tasks);

  @override
  List<Object?> get props => [tasks];
}


class SolutionLoadedEvent extends AppEvent {
  final String id;
  final List<Cell> solution;

  const SolutionLoadedEvent(this.id, this.solution);

  @override
  List<Object?> get props => [solution];
}


class ResultsLoadedEvent extends AppEvent {
  final ResultsModel results;

  const ResultsLoadedEvent(this.results);

  @override
  List<Object?> get props => [results];
}

class ToggleHomeButtonEvent extends AppEvent {
  final bool active;

  const ToggleHomeButtonEvent(this.active);

  @override
  List<Object?> get props => [active];

}

class ToggleCalcButtonEvent extends AppEvent {
  final bool active;

  const ToggleCalcButtonEvent(this.active);

  @override
  List<Object?> get props => [active];

}

class SetCurrentSolutionIdEvent extends AppEvent {
  final String id;

  const SetCurrentSolutionIdEvent(this.id);

  @override
  List<Object?> get props => [id];

}
