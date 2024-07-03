import 'data_structures.dart';

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
  final result = shortestPath.reversed.toList();

  return result;
}