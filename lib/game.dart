import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game_demo/animations/blue_bird_component.dart';
import 'package:flutter_game_demo/animations/dino_group_component.dart';
import 'package:flutter_game_demo/components/parallax_component.dart';

class FlutterDemoGame extends FlameGame with TapDetector {
  static final fpsTextConfig = TextPaint(style: const TextStyle(color: Colors.white));
  final parallaxComponent = BackgroundParallaxComponent();
  final groupAnimationComponent = DinoGroupComponent();
  final fpsComponent = FpsComponent();

  @override
  Future<void>? onLoad() async {
    await add(parallaxComponent);
    await add(groupAnimationComponent);
    await add(BlueBirdComponent());
    await add(fpsComponent);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    // The average FPS for the last 120 microseconds.
    fpsTextConfig.render(canvas, fpsComponent.fps.toStringAsFixed(2), Vector2(10, 30));
  }

  @override
  bool onTapDown(TapDownInfo info) {
    groupAnimationComponent.jump();
    return true;
  }

  @override
  bool onTapUp(TapUpInfo info) {
    // groupAnimationComponent.stop();
    return true;
  }
}
