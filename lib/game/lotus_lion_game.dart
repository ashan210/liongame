import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/painting.dart';
import 'package:liongame/components/background.dart';
import 'package:liongame/components/ground.dart';
import 'package:liongame/components/lion.dart';
import 'package:liongame/components/lt_group.dart';
import 'package:liongame/game/configuration.dart';

class LotusLionGame extends FlameGame with TapDetector, HasCollisionDetection{
  late Lion lion;
  late TextComponent score;
  Timer interval = Timer(Config.ltInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      lion = Lion(),
      score = buildScore(),
      
      ]);

      interval.onTick = () => add(LtGroup());
  }

  TextComponent buildScore() {
    return TextComponent(
      text: 'Score: 0',
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Game'),
        ),
    );
  }

  @override
  void onTap() {
    super.onTap();
    lion.fly();
  }

  @override
  void update(double dt){
    super.update(dt);
    interval.update(dt);

    score.text = 'Score: ${lion.score}';
  }
}