import 'package:tuple/tuple.dart';

const OBSTACLE = 'X';

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



void bfs(GridGraph graph, Cell source, Map<Cell, Cell?> parents, Map<Cell, int> distances) {
  final q = Queue<Cell>();
  distances[source] = 0;
  q.enqueue(source);

  while (!q.empty()) {
    final cell = q.dequeue();

    for (Cell neighbor in graph.graph[cell]!) {
      if (distances[neighbor] == -1) {
        parents[neighbor] = cell;
        distances[neighbor] = distances[cell]! + 1;
        q.enqueue(neighbor);
      }
    }
  }
}



List<Cell> findShortestPath(GridGraph graph, Cell source, Cell destination) {
  final shortestPath = <Cell>[];
  final parents = <Cell, Cell?>{};
  final distances = <Cell, int>{};
  for (final vertice in graph.cells) {
    parents[vertice] = null;
    distances[vertice] = -1;
  }
  bfs(graph, source, parents, distances);

  if (distances[destination] == -1) {
    return shortestPath;
  }

  Cell currentCell = destination;
  shortestPath.add(currentCell);

  while (parents[currentCell] != null) {
    shortestPath.add(parents[currentCell]!);
    currentCell = parents[currentCell]!;
  }

  return shortestPath;
}




void main() {
  final graph = GridGraph();
  final graph2 = GridGraph();

  graph.formGraph(['.X.', '.X.', '...']);
  print(findShortestPath(graph, const Cell(2, 1), const Cell(0, 2)));

  graph2.formGraph([
    "XXX.",
    "X..X",
    "X..X",
    ".XXX"
  ]);
  print(findShortestPath(graph2, const Cell(0, 3), const Cell(3, 0)));
}
