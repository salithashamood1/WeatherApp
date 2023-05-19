import 'package:flutter/cupertino.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails(
      {Key? key, required this.leftSideString, required this.rightSideString})
      : super(key: key);

  final String leftSideString;
  final String rightSideString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leftSideString),
          Text(rightSideString),
        ],
      ),
    );
  }
}
