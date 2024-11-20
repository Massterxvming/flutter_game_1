

import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame/src/components/core/component.dart';
import 'package:flutter/material.dart';

class StickGameApp extends FlameGame{
  final Paint paint = Paint()..color = const Color.fromARGB(255, 35, 26, 36);
  final Path canvasPath = Path();

  @override
  Future<void>? onLoad() async {
    canvasPath.addRRect(Rect.fromLTWH(0,0,canvasSize.x,Canvas))
    return super.onLoad();

  }
}