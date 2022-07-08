import 'package:flutter/material.dart';

class CalendarView extends StatelessWidget {
  final List<String> list;
  final BoxConstraints constraints;
  const CalendarView(
    this.list,
    this.constraints, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: list
          .map(
            (filter) => CalendarTile(
              label: filter,
              width: constraints.maxWidth,
              height: constraints.maxHeight,
            ),
          )
          .toList(),
    );
  }
}

class CalendarTile extends StatelessWidget {
  final String? label;
  final double width;
  final double height;
  const CalendarTile({
    Key? key,
    required this.width,
    required this.label,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double circleRadius = 10;
    var dd = label!.split(' ').last;
    var currentDate = '${DateTime.now().day}' == dd;
    return Opacity(
      opacity: currentDate ? 1 : 0.3,
      child: Wrap(
        direction: Axis.vertical,
        children: [
          Container(
            width: width / 9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(circleRadius),
              color: const Color.fromARGB(255, 80, 76, 76),
            ),
            //padding: EdgeInsets.only(top: width / 22),
            margin: EdgeInsets.only(
                bottom: 10, left: width / 100, right: width / 100, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label!,
                  style: TextStyle(
                    color: Color.fromARGB(255, 182, 181, 181),
                    fontSize: width / 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
