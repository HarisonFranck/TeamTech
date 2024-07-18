import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SideBarSelected extends StatefulWidget {
  final String sideBarTitles;
  final Icon sideBarIcons;
  bool selected;

  SideBarSelected({
    required this.sideBarTitles,
    required this.sideBarIcons,
    required this.selected,
  });

  @override
  State<StatefulWidget> createState() {
    return SideBarSelectedState();
  }
}

class SideBarSelectedState extends State<SideBarSelected> {
  @override
  Widget build(BuildContext context) {
    print('isSelected: ${widget.selected}');

    return Container(
      width: 250,
      height: 80,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.white.withOpacity(0.05),
        Colors.white.withOpacity(0.3),
      ])),
      child: Row(children: [
        const SizedBox(
          width: 30,
        ),
        widget.sideBarIcons,
        const SizedBox(
          width: 40,
        ),
        Text('${widget.sideBarTitles}',
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 2,
                fontSize: 15))
      ]),
    );
  }
}
