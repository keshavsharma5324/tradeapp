import 'package:flutter/material.dart';

class CenterDockedFAB extends StatelessWidget {
  const CenterDockedFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 70,
      width: 70,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color(0xFF436EDD),
              Color(0xFFAF7CE3),
              Color(0xFFAF69C7),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5))
          ]),
    );
  }
}
