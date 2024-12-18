import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameApp extends FlameGame {
  Offset circleCenter = const Offset(0, 0);
  final Paint paint = Paint()..color = Colors.yellow;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(circleCenter, 20, paint);
  }

  @override
  void update(double dt) {
    super.update(dt);
    circleCenter =  circleCenter.translate(1, 1);
  }
}
