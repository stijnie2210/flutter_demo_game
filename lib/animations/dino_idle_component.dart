import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/services.dart';

class DinoIdleComponent extends SpriteAnimationComponent with KeyboardHandler {
  DinoIdleComponent()
      : super(
          size: Vector2.all(80),
          anchor: Anchor.bottomLeft,
        );

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;

    final isRight = keysPressed.contains(LogicalKeyboardKey.arrowDown);

    if (isRight && isKeyDown) {
      return true;
    }
    return false;
  }

  @override
  Future<void>? onLoad() async {
    final dinoAnimation = await Flame.images.load('DinoSprites - vita.png');
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
      image: dinoAnimation,
      columns: 24,
      rows: 1,
    );
    animation = spriteSheet.createAnimation(
      row: 0,
      stepTime: 0.1,
      from: 0,
      to: 3,
    );
  }
}
