import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'game.dart';
import 'input.dart';

main() async {
  Flame.audio.disableLog();
  await Flame.util.initialDimensions();

  MyGame game = MyGame();

  runApp(MaterialApp(
    routes: {
      '/': (BuildContext ctx) => Scaffold(body: WillPopScope(
        onWillPop: () async {
          game.pause();
          return false;
        },
        child: game.widget,
      )),
    },
  ));

  Input(game).attach();
}
