import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_game_demo/game.dart';

enum DinoState {
  idle,
  run,
}

class DinoGroupComponent extends SpriteAnimationGroupComponent with HasGameRef<FlutterDemoGame> {
  DinoGroupComponent() : super(size: Vector2.all(80));

  @override
  Future<void>? onLoad() async {
    final dinoAnimationSprite = await Flame.images.load('DinoSprites - vita.png');
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
      image: dinoAnimationSprite,
      columns: 24,
      rows: 1,
    );
    final dinoIdleAnimation = spriteSheet.createAnimation(
      row: 0,
      stepTime: 0.1,
      from: 0,
      to: 3,
    );

    final runAnimation = spriteSheet.createAnimation(
      row: 0,
      from: 4,
      to: 10,
      stepTime: 0.1,
    );
    animations = {
      DinoState.idle: dinoIdleAnimation,
      DinoState.run: runAnimation,
    };
    current = DinoState.idle;

    return super.onLoad();
  }

  void run() {
    current = DinoState.run;
  }

  void stop() {
    current = DinoState.idle;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    x = width;
    y = size.y - 32 - height;
  }
}
