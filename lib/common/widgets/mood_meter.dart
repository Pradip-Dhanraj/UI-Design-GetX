import 'package:flutter/material.dart';
import 'package:qubehealth/models/feelings_model.dart';

class MoodMeterView extends StatelessWidget {
  final BoxConstraints constraints;
  final List<Feelings> list;
  const MoodMeterView(
    this.constraints,
    this.list, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: list
          .map(
            (filter) => MoodMeter(
              percentage: filter.percentage!,
              text2: filter.icon,
              label: filter.label,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
            ),
          )
          .toList(),
    );
  }
}

class MoodMeter extends StatelessWidget {
  final double percentage;
  final String? text2;
  final String? label;
  final double width;
  final double height;
  const MoodMeter({
    Key? key,
    required this.percentage,
    required this.text2,
    required this.width,
    required this.height,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double circleRadius = width / 9;
    return Opacity(
      opacity: percentage > 0 ? 1 : 0.3,
      child: Wrap(
        direction: Axis.vertical,
        children: [
          Container(
            width: width / 9,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 201, 199, 199).withAlpha(90),
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset:
                      const Offset(3.0, 2.0), // shadow direction: bottom right
                )
              ],
              borderRadius: BorderRadius.circular(circleRadius),
              color: const Color.fromARGB(255, 201, 199, 199).withAlpha(75),
            ),
            padding: EdgeInsets.only(top: width / 22),
            margin: EdgeInsets.only(
              bottom: width / 15,
              left: width / 100,
              right: width / 100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$percentage%',
                  style: TextStyle(
                    fontSize: width / 30,
                  ),
                ),
                SizedBox(
                  height: height / 10,
                ),
                Container(
                  height: circleRadius,
                  width: circleRadius,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 110, 180, 112),
                      borderRadius: BorderRadius.circular(
                        circleRadius,
                      )
                      //more than 50% of width makes circle
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        text2 ?? "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: circleRadius / 2),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // Text(
          //   label!,
          //   style: TextStyle(fontSize: 5),
          // ),
        ],
      ),
    );
  }
}
