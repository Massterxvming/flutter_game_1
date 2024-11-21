import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game_1/modules/target_compontent.dart';

class StickGameApp extends FlameGame with DragCallbacks {
  final Paint paint = Paint()..color = const Color.fromARGB(255, 182, 142, 67);
  final Path canvasPath = Path();

  //角色
  late TargetCompontent targetCompontent;
  bool _pointOnTarget = false;
  
  //安全距离
  // double safeTop = MediaQuery.of(context).padding.top;


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

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void onDragStart(DragStartEvent event) {
    print('on Start Dragging:${event.canvasPosition}');
    // print(targetCompontent.path.transform(matrix4));
    double distance =
        event.canvasPosition.distanceTo(targetCompontent.position);
    if (distance <= 20) {
      _pointOnTarget = true;
      print('点中目标');
    }
    else{
      _pointOnTarget = false;
    }
    super.onDragStart(event);
  }

  @override
  void onDragCancel(DragCancelEvent event) {
    // print('on Cancel Dragging');
    super.onDragCancel(event);
  }

  @override
  void onDragEnd(DragEndEvent event) {
    // print('on End Dragging');
    super.onDragEnd(event);
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    // print('on Update Dragging');
    super.onDragUpdate(event);
    if (event.canvasStartPosition.x < targetCompontent.radius ||
        event.canvasStartPosition.x > canvasSize.x - targetCompontent.radius ||
        event.canvasStartPosition.y < targetCompontent.radius ||
        event.canvasStartPosition.y > canvasSize.y - targetCompontent.radius) {
      print('触摸区域超出界限');
      return;
    }
    if (isDragged&&_pointOnTarget) {
      targetCompontent.position.add(event.canvasDelta);
      print('正在拖拽');
    }
    // targetCompontent.onDragUpdate(event);
  }
}
