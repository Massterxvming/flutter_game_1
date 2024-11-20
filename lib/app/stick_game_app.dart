import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game_1/modules/target_compontent.dart';

class StickGameApp extends FlameGame with DragCallbacks {
  final Paint paint = Paint()..color = const Color.fromARGB(255, 182, 142, 67);
  final Path canvasPath = Path();

  //角色
  late TargetCompontent targetCompontent;

  @override
  Future<void>? onLoad() async {
    print('game is loading...');
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

  @override
  void onDragStart(DragStartEvent event) {
    // TODO: implement onDragStart
    print('on Start Dragging');
    // print(targetCompontent.path.transform(matrix4));
    print(targetCompontent.position);
    print('event point position:${event.devicePosition}');
    double distance = event.devicePosition.distanceTo(targetCompontent.position);
    if(distance<=20){
      print('点中目标');
    }
    super.onDragStart(event);
  }

  @override
  void onDragCancel(DragCancelEvent event) {
    // TODO: implement onDragCancel
    // print('on Cancel Dragging');
    super.onDragCancel(event);
  }

  @override
  void onDragEnd(DragEndEvent event) {
    // TODO: implement onDragEnd
    // print('on End Dragging');
    super.onDragEnd(event);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    // TODO: implement onDragUpdate
    // print('on Update Dragging');
    super.onDragUpdate(event);
  }
}
