import 'package:webspark_test_task/utils/constants.dart';
import 'package:tuple/tuple.dart';

typedef Cell = Tuple2<int, int>;


class GridGraph {
  final _graph = <Cell, List<Cell>>{};
  final _cells = <Cell>[];
  int _vertices = 0;

  GridGraph();

  void formGraph(List<String> grid) {
    final int rows = grid.length;
    final int cols = grid.first.length;

    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < cols; x++) {
        if (grid[y][x] != OBSTACLE) {
          _vertices++;
          _graph[Cell(x, y)] = [];
          _cells.add(Cell(x, y));

          // x-1, y
          if ((x-1) >= 0 && grid[y][x-1] != OBSTACLE) {
            _graph[Cell(x, y)]!.add(Cell(x-1, y));
          }
          // x-1, y-1
          if ((x-1) >= 0 && (y-1) >= 0 && grid[y-1][x-1] != OBSTACLE) {
            _graph[Cell(x, y)]!.add(Cell(x-1, y-1));
          }
          // x, y-1
          if ((y-1) >= 0 && grid[y-1][x] != OBSTACLE) {
            _graph[Cell(x, y)]!.add(Cell(x, y-1));
          }
          // x+1, y-1
          if ((x+1) < cols && (y-1) >= 0 && grid[y-1][x+1] != OBSTACLE) {
            _graph[Cell(x, y)]!.add(Cell(x+1, y-1));
          }
          // x+1, y
          if ((x+1) < cols && grid[y][x+1] != OBSTACLE) {
            _graph[Cell(x, y)]!.add(Cell(x+1, y));
          }
          // x+1, y+1
          if ((x+1) < cols && (y+1) < rows && grid[y+1][x+1] != OBSTACLE) {
            _graph[Cell(x, y)]!.add(Cell(x+1, y+1));
          }
          // x, y+1
          if ((y+1) < rows && grid[y+1][x] != OBSTACLE) {
            _graph[Cell(x, y)]!.add(Cell(x, y+1));
          }
          // x-1, y+1
          if ((x-1) >= 0 && (y+1) < rows && grid[y+1][x-1] != OBSTACLE) {
            _graph[Cell(x, y)]!.add(Cell(x-1, y+1));
          }
        }
      }
    }
  }

  Map<Cell, List<Cell>> get graph => _graph;
  List<Cell> get cells => _cells;
  int get vertices => _vertices;
}


class Queue<T> {
  List<T> _queue = [];

  Queue();

  void enqueue(T value) {
    _queue.add(value);
  }

  T dequeue() {
    final res = _queue.first;
    _queue.remove(_queue.first);
    return res;
  }

  void clear() {
    _queue = [];
  }

  bool empty() {
    return _queue.isEmpty;
  }

  T peek() {
    return _queue.first;
  }
}
