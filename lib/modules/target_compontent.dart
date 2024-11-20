
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class TargetCompontent {
  final Vector2 position;
  final double radius;
  late Paint paint = Paint()..color = Colors.greenAccent;

  final path= Path();

  TargetCompontent({
    required this.position,
    this.radius = 20,
  });

  void render(Canvas canvas){
    canvas.drawCircle(position.toOffset(), radius, paint);
  }
}