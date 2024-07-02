import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:webspark_test_task/utils/data_structures.dart';
import 'package:webspark_test_task/utils/search.dart';

import '../../models/results_model.dart';
import '../../models/tasks_model.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<EnterUrlEvent>((event, emit) {
      if (state is AppInitial) {
        final prevState = state as AppInitial;
        final newState = AppLoaded(
            url: event.url,
            totalTasks: prevState.totalTasks,
            tasksDone: prevState.tasksDone,
            tasks: prevState.tasks,
            solutions: prevState.solutions,
            results: prevState.results,
            homeButtonActive: prevState.homeButtonActive,
            calcButtonActive: prevState.calcButtonActive,
            currentId: prevState.currentId,
        );
        emit(newState);
      }
      else {
        final prevState = state as AppLoaded;
        final newState = AppLoaded(
            url: event.url,
            totalTasks: prevState.totalTasks,
            tasksDone: prevState.tasksDone,
            tasks: prevState.tasks,
            solutions: prevState.solutions,
            results: prevState.results,
            homeButtonActive: prevState.homeButtonActive,
            calcButtonActive: prevState.calcButtonActive,
            currentId: prevState.currentId,
        );
        emit(newState);
      }
    });
    on<TasksLoadedEvent>((event, emit) {
      final prevState = state as AppLoaded;
      final newState = AppLoaded(
          url: prevState.url,
          totalTasks: event.tasks.data.length,
          tasksDone: prevState.tasksDone,
          tasks: event.tasks,
          solutions: prevState.solutions,
          results: prevState.results,
          homeButtonActive: true,
          calcButtonActive: prevState.calcButtonActive,
          currentId: prevState.currentId,
      );
      emit(newState);

      for (final task in event.tasks.data) {
        final graph = GridGraph();
        graph.formGraph(List<String>.from(task.field));
        final solution = findShortestPath(graph, Cell(task.start.x, task.start.y), Cell(task.end.x, task.end.y));
        add(SolutionLoadedEvent(task.id, solution));
      }
    });
    on<SolutionLoadedEvent>((event, emit) {
      final prevState = state as AppLoaded;
      final newState = AppLoaded(
          url: prevState.url,
          totalTasks: prevState.totalTasks,
          tasksDone: prevState.tasksDone + 1,
          tasks: prevState.tasks,
          solutions: Map<String, List<Cell>>.from(prevState.solutions)..[event.id] = event.solution,
          results: prevState.results,
          homeButtonActive: prevState.homeButtonActive,
          calcButtonActive: prevState.calcButtonActive,
          currentId: prevState.currentId,
      );
      emit(newState);
    });
    on<ResultsLoadedEvent>((event, emit) {
      final prevState = state as AppLoaded;
      final newState = AppLoaded(
          url: prevState.url,
          totalTasks: prevState.totalTasks,
          tasksDone: prevState.tasksDone,
          tasks: prevState.tasks,
          solutions: prevState.solutions,
          results: event.results,
          homeButtonActive: prevState.homeButtonActive,
          calcButtonActive: true,
          currentId: prevState.currentId,
      );
      emit(newState);
    });
    on<ToggleHomeButtonEvent>((event, emit) {
      final prevState = state as AppLoaded;
      final newState = AppLoaded(
        url: prevState.url,
        totalTasks: prevState.totalTasks,
        tasksDone: prevState.tasksDone,
        tasks: prevState.tasks,
        solutions: prevState.solutions,
        results: prevState.results,
        homeButtonActive: event.active,
        calcButtonActive: prevState.calcButtonActive,
        currentId: prevState.currentId,
      );
      emit(newState);
    });
    on<ToggleCalcButtonEvent>((event, emit) {
      final prevState = state as AppLoaded;
      final newState = AppLoaded(
        url: prevState.url,
        totalTasks: prevState.totalTasks,
        tasksDone: prevState.tasksDone,
        tasks: prevState.tasks,
        solutions: prevState.solutions,
        results: prevState.results,
        homeButtonActive: prevState.homeButtonActive,
        calcButtonActive: event.active,
        currentId: prevState.currentId,
      );
      emit(newState);
    });
    on<SetCurrentSolutionIdEvent>((event, emit) {
      final prevState = state as AppLoaded;
      final newState = AppLoaded(
        url: prevState.url,
        totalTasks: prevState.totalTasks,
        tasksDone: prevState.tasksDone,
        tasks: prevState.tasks,
        solutions: prevState.solutions,
        results: prevState.results,
        homeButtonActive: prevState.homeButtonActive,
        calcButtonActive: prevState.calcButtonActive,
        currentId: event.id,
      );
      emit(newState);
    });
  }
}
