import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame/src/components/core/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game_1/modules/target_compontent.dart';

class StickGameApp extends FlameGame {
  final Paint paint = Paint()..color = const Color.fromARGB(255, 106, 18, 116);
  final Path canvasPath = Path();

  //角色
  late TargetCompontent targetCompontent;

  @override
  Future<void>? onLoad() async {
    canvasPath.addRect(Rect.fromLTWH(0, 0, canvasSize.x, canvasSize.y));

    // ignore: dead_code
    targetCompontent =
        TargetCompontent(position: Vector2(canvasSize.x / 2, canvasSize.y / 2));

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawPath(canvasPath, paint);

    targetCompontent.render(canvas);
  }
}
