//
//  FloodFill.dart
//  BFS-Showcase
//
//  Created by Mixalis Dobekidis on 5/5/21.
//

import '../MazeLocation.dart';

class FloodFill {
  int stepCounter = 0;
  List<int> map = [];
  List<List<int>> map2D = [];
  List<List<int>> visited = [];

  FloodFill(List<int> _map, List<List<int>> _map2D) {
    map = _map;
    map2D = _map2D;

    var counter = 0;
    var innerCounter = 0;
    for (var item in map2D) {
      visited.add([]);
      for (var i in item) {
        visited[counter].add(0);
      }
      counter += 1;
      innerCounter = 0;
    }
    //map2D.map((row) => {row.map((e) => 0)}).cast<List<int>>();
  }

  void resetVisited() {
    // also the step counter
    stepCounter = 0;

    var counter = 0;
    var innerCounter = 0;
    for (var item in visited) {
      for (var i in item) {
        visited[counter][innerCounter] = 0;
        innerCounter += 1;
      }
      counter += 1;
      innerCounter = 0;
    }
  }

  List<List<int>> getVisited() {
    return visited;
  }

  Cell getVectorTypeBy(MazeLocation point) {
    int maxRow = 7;
    int maxCol = 7;

    if (point.getRow() < 0) {
      return Cell.notFound;
    }

    if (point.getCol() < 0) {
      return Cell.notFound;
    }

    if (point.getRow() > maxRow || point.getCol() > maxCol) {
      return Cell.notFound;
    }

    if (map2D[point.getRow()][point.getCol()] == 0) {
      return Cell.blocked;
    } else if (map2D[point.getRow()][point.getCol()] == 1) {
      return Cell.empty;
    } else if (map2D[point.getRow()][point.getCol()] == 2) {
      return Cell.goal;
    } else if (map2D[point.getRow()][point.getCol()] == 5) {
      return Cell.key;
    } else {
      return Cell.notFound;
    }
  }

  bool isValidBlock(int row, int col) {
    int maxRow = 7;
    int maxCol = 7;
    Cell type = getVectorTypeBy(MazeLocation(row: row, col: col));

    if (row < 0 || row > maxRow || col < 0 || col > maxCol) {
      return false;
    } else {
      //print(type);
      if (type == Cell.blocked || type == Cell.notFound) {
        return false;
      } else {
        // finally
        return true;
      }
    }
  }

  void floodFill(int row, int col, int step, MazeLocation teamPosition) {
    if (isValidBlock(row, col) == false) {
      //Base case
      return null;
    }

    // we already visited that
    if (visited[row][col] == 1 || visited[row][col] == 2) {
      return null;
    }

    // moving in the right direction
    //if stepCounter < step {
    stepCounter += 1;
    visited[row][col] = 1;
    //}

    int distance = pointManhattanDistance(MazeLocation(row: row, col: col), teamPosition);

    if (distance == step) {
      //Current node is marked as visited.
      // check if path contains valid number of steps, we use DFS for this
      visited[row][col] = 2;
      stepCounter = 0;
    }

    floodFill(row - 1, col, step, teamPosition);
    floodFill(row + 1, col, step, teamPosition);
    floodFill(row, col - 1, step, teamPosition);
    floodFill(row, col + 1, step, teamPosition);

    // no diagonal checking
    //floodFill(i-1,j-1,idxValue);
    //floodFill(i-1,j+1,idxValue);
    //floodFill(i+1,j-1,idxValue);
    //floodFill(i+1,j+1,idxValue);
  }

  int pointManhattanDistance(MazeLocation from, MazeLocation to) {
    return ((from.getRow() - to.getRow()).abs() + (from.getCol() - to.getCol()).abs());
  }
}
