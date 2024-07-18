import 'package:flutter/material.dart';

class Payments extends StatelessWidget {
  const Payments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Search',
        style: TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
