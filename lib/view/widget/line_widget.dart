import 'dart:math';

import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({super.key, required this.image, required this.scale});
  final String image;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(image),
          SizedBox(
            height: 18,
          ),
          Container(
            height: 3,
            width: 39,
            color: Color(0xFF016DD9),
          )
        ],
      ),
    );
  }
}
