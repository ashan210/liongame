import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:liongame/game/lotus_lion_game.dart';

void main() {

  final game = LotusLionGame();
  runApp(
    GameWidget(game: game),
  );
}

