import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:liongame/game/lotus_lion_game.dart';
import 'package:liongame/screens/game_over_screen.dart';
import 'package:liongame/screens/main_menu_screen.dart';

void main() {

  final game = LotusLionGame();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const[MainMenuScreen.id],
      overlayBuilderMap: {
        'mainMenu': (context, _) => MainMenuScreen(game: game),
        'gameOver': (context, _) => GameOverScreen(game: game),
      },
    ),
  );
}

