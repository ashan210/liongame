import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:liongame/components/background.dart';
import 'package:liongame/components/ground.dart';
import 'package:liongame/components/lion.dart';
import 'package:liongame/components/lt_group.dart';
import 'package:liongame/game/configuration.dart';

class LotusLionGame extends FlameGame {
  late Lion lion;
  Timer interval = Timer(Config.ltInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      lion = Lion(),
      
      ]);

      interval.onTick = () => add(LtGroup());
  }

  @override
  void update(double dt){
    super.update(dt);
    interval.update(dt);
  }
}