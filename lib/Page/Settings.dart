import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Settings',
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
