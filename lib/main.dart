import 'package:app_mc_games/data/data.dart';
import 'package:app_mc_games/widget/color_speed_dial.dart';
import 'package:app_mc_games/widget/painting_widget.dart';
import 'package:app_mc_games/widget/stroke_speed_dial.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: const MyApp(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.grey,
        ),
        title: 'MCPaint',
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Color? currentColor;
  double? currentStrokeWidth;

  @override
  void initState() {
    super.initState();

    currentColor = speedDials[0].color;
    currentStrokeWidth = strokeWidths[0];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: PaintingWidget(color: currentColor!, strokeWidth: currentStrokeWidth!),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            ColorSpeedDial(onSelected: color),
            StrokeSpeedDial(onSelected: strokeWidth),
          ],
        ),
      );

  void color(Color color) => setState(() {
        currentColor = color;
      });

  void strokeWidth(double strokeWidth) => setState(() {
        currentStrokeWidth = strokeWidth;
      });
}
