import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter_game_demo/config/constants.dart';
import 'package:flutter_game_demo/game.dart';

class BlueBirdComponent extends SpriteAnimationComponent with HasGameRef<FlutterDemoGame> {
  double speedX = 200;

  BlueBirdComponent()
      : super(
          size: Vector2.all(80),
        );

  @override
  Future<void>? onLoad() async {
    final blueBirdImage = await Flame.images.load('enemy/blue_bird.png');
    final spriteSheet = SpriteSheet.fromColumnsAndRows(
      image: blueBirdImage,
      columns: 9,
      rows: 1,
    );
    animation = spriteSheet.createAnimation(
      row: 0,
      stepTime: 0.1,
      from: 0,
      to: 9,
    );
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    height = width = size.x / numberOfTilesAlongWidth;
    x = size.x + width;
    y = size.y - groundHeight - height - 25;
    size = size;
  }

  @override
  void update(double dt) {
    if (x < -width) {
      // parent?.remove(this);
      x = size.x + gameRef.canvasSize.x;
    } else {
      x -= speedX * dt;
    }

    super.update(dt);
  }
}
