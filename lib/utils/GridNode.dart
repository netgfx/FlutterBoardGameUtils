//
//  GridNode.dart
//  BFS-Showcase
//
//  Created by Mixalis Dobekidis on 6/5/21.
//

import 'package:trivia_wars/utils/Grid.dart';

import '../MazeLocation.dart';

class GridNode {
  int x = 0;
  int y = 0;
  Cell type;
  bool opened = false;
  bool closed = false;
  GridNode parent;

  GridNode(int _x, int _y, Cell _type) {
    x = _x;
    y = _y;
    type = _type;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }

  void setClosed(bool value) {
    closed = value;
  }

  void setOpened(bool value) {
    opened = value;
  }

  bool getClosed() {
    return closed;
  }

  bool getOpened() {
    return opened;
  }

  void setParent(GridNode value) {
    parent = value;
  }

  GridNode getParent() {
    return parent;
  }

  Cell getType() {
    return type ?? Cell.empty;
  }

  MazeLocation getAsML() {
    return MazeLocation(row: x, col: y);
  }
}
