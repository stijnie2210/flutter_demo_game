import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter_game_demo/animations/dino_idle_component.dart';
import 'package:flutter_game_demo/components/parallax_component.dart';

class FlutterDemoGame extends FlameGame with HasKeyboardHandlerComponents {
  @override
  Future<void>? onLoad() async {
    await add(BackgroundParallaxComponent());
    await add(
      DinoIdleComponent()
        ..x = 80
        ..y = 350,
    );
  }
}
