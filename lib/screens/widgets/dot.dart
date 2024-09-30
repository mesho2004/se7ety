import 'package:flutter/material.dart';

Widget buildDot(int index, int currentIndex) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 8,
      width: currentIndex == index ? 12 : 8,
      decoration: BoxDecoration(
        color: currentIndex == index ? Colors.teal : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }