import 'package:flutter/material.dart';

class Utils {
  static Offset localPosition(BuildContext context, Offset globalPosition) {
    RenderBox getBox = context.findRenderObject() as RenderBox;
    var localPosition = getBox.globalToLocal(globalPosition);
    return localPosition;
  }
}
