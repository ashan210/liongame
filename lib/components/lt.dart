import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:liongame/game/assets.dart';
import 'package:liongame/game/configuration.dart';
import 'package:liongame/game/lotus_lion_game.dart';
import 'package:liongame/game/lt_position.dart';

class LotusTower extends SpriteComponent with HasGameRef<LotusLionGame> {
  LotusTower({
    required this.ltPosition,
    required this.height,
  });

  @override
  final double height;
  final LtPosition ltPosition;

  @override
  Future<void> onLoad() async {
    final lt = await Flame.images.load(Assets.lt);
    final ltupside = await Flame.images.load(Assets.ltupside);
    size = Vector2(180, height);

    switch (ltPosition) {
      case LtPosition.top:
        position.y = -20;
        sprite = Sprite(ltupside);
        break;
      case LtPosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight + 3;
        sprite = Sprite(lt);
        break;
    }

    add(RectangleHitbox());
  }
}