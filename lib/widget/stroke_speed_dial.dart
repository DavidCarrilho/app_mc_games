import 'package:app_mc_games/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class StrokeSpeedDial extends StatefulWidget {
  final void Function(double) onSelected;

  const StrokeSpeedDial({
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  @override
  StrokeSpeedDialState createState() => StrokeSpeedDialState();
}

class StrokeSpeedDialState extends State<StrokeSpeedDial> {
  double? currentStrokeWidth;

  @override
  void initState() {
    super.initState();

    currentStrokeWidth = strokeWidths[0];
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        // width: 150.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SpeedDial(
            overlayOpacity: 0.0,
            elevation: 0.0,
            backgroundColor: Theme.of(context).primaryColor,
            visible: true,
            curve: Curves.elasticInOut,
            children: strokeWidths.map(speedDialChild).toList(),
            child: Stack(
              children: [
                const Center(child: Icon(Icons.edit, size: 36)),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.red,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      child: buildText(currentStrokeWidth!),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  SpeedDialChild speedDialChild(double strokeWidth) => SpeedDialChild(
        child: CircleAvatar(child: buildText(strokeWidth)),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        onTap: () => onTap(strokeWidth),
        labelStyle: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      );

  Widget buildText(double strokeWidth) => FittedBox(
        fit: BoxFit.contain,
        child: Text('${strokeWidth.toInt()}'),
      );

  void onTap(double strokeWidth) {
    setState(() {
      currentStrokeWidth = strokeWidth;
    });
    widget.onSelected(strokeWidth);
  }
}
