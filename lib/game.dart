import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter_game_demo/animations/dino_group_component.dart';
import 'package:flutter_game_demo/animations/dino_idle_component.dart';
import 'package:flutter_game_demo/animations/dino_run_component.dart';
import 'package:flutter_game_demo/components/parallax_component.dart';

class FlutterDemoGame extends FlameGame with TapDetector {
  final groupAnimationComponent = DinoGroupComponent();
  @override
  Future<void>? onLoad() async {
    await add(BackgroundParallaxComponent());
    await add(groupAnimationComponent);
  }

  @override
  bool onTapDown(TapDownInfo info) {
    groupAnimationComponent.run();
    return true;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    groupAnimationComponent.stop();
    return true;
  }
}
