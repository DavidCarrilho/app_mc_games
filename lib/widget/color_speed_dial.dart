import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:app_mc_games/data/data.dart';

class ColorSpeedDial extends StatefulWidget {
  final void Function(Color) onSelected;

  const ColorSpeedDial({
    Key? key,
    required this.onSelected,
  }) : super(key: key);

  @override
  ColorSpeedDialState createState() => ColorSpeedDialState();
}

class ColorSpeedDialState extends State<ColorSpeedDial> {
  Color? currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = speedDials[0].color;
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 180.0,
        child: SpeedDial(
          overlayOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: currentColor,
          visible: true,
          curve: Curves.elasticInOut,
          children: speedDials
              .map((entry) => speedDialChild(color: entry.color, label: entry.label))
              .toList(),
          child: const Icon(Icons.color_lens, size: 36),
        ),
      );

  SpeedDialChild speedDialChild({Color? color, String? label}) => SpeedDialChild(
        child: CircleAvatar(backgroundColor: color),
        backgroundColor: Colors.white,
        onTap: () => onTap(color!),
        elevation: 0.0,
        label: label,
        labelStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        labelBackgroundColor: color,
      );

  void onTap(Color color) {
    setState(() {
      currentColor = color;
    });
    widget.onSelected(color);
  }
}
