//
//  MazeLocation.dart
//  BFS-Showcase
//
//  Created by Mixalis Dobekidis on 5/5/21.
//

enum Cell {
  empty, // 1
  blocked, // = 0
  key, // = 5
  goal, // = 2
  notFound //= -1
}

class MazeLocation {
  int _row = 0;
  int _col = 0;

  MazeLocation({int row, int col}) {
    _row = row;
    _col = col;
  }

  getRow() {
    return _row;
  }

  getCol() {
    return _col;
  }
}
