import 'package:flutter/material.dart';
import 'Board.dart';
import 'main.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'Main': (context) => MyHomePage(
        title: "Trivia Wars",
      ),
  // When navigating to the "/second" route, build the SecondScreen widget.
  'Board': (context) => Board(
        key: UniqueKey(),
      ),
  //'MessageReply': (context) => MessageReply(key: UniqueKey()),
};
