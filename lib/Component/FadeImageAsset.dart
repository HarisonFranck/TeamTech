import 'package:flutter/material.dart';

class FadeImageAsset extends StatelessWidget {
  final String pathImage;

  const FadeImageAsset({required this.pathImage});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Colors.transparent,
                Colors.transparent,
                Colors.black
              ],
              stops: [0.0, 0.8, 1.0],
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
          child: Image.asset('assets/images/$pathImage',
              fit: BoxFit.contain, width: 120),
        );
      },
    );
  }
}
