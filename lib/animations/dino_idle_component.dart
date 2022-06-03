import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

class DinoIdleComponent extends SpriteAnimationComponent with KeyboardHandler {
  DinoIdleComponent()
      : super(
          size: Vector2.all(80),
          anchor: Anchor.bottomLeft,
        );

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
