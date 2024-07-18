import 'package:flutter/material.dart';

class RotatingWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const RotatingWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 1),
  }) : super(key: key);

  @override
  _RotatingWidgetState createState() => _RotatingWidgetState();
}

class _RotatingWidgetState extends State<RotatingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    print('Rotation');
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(); // Animation en boucle

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: widget.child,
    );
  }
}

// ignore: must_be_immutable
class SideBar extends StatefulWidget {
  final String sideBarTitles;
  final Icon sideBarIcons;
  bool selected;

  SideBar({
    required this.sideBarTitles,
    required this.sideBarIcons,
    required this.selected,
  });

  @override
  State<StatefulWidget> createState() {
    return SideBarState();
  }
}

class SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 80,
      decoration: BoxDecoration(
          gradient: (widget.selected)
              ? LinearGradient(colors: [
                  Colors.white.withOpacity(0.05),
                  Colors.white.withOpacity(0.3),
                ])
              : null),
      child: Row(children: [
        const SizedBox(
          width: 30,
        ),
        (widget.selected)
            ? RotatingWidget(child: widget.sideBarIcons)
            : widget.sideBarIcons,
        const SizedBox(
          width: 40,
        ),
        Text('${widget.sideBarTitles}',
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontWeight:
                    (widget.selected) ? FontWeight.w600 : FontWeight.w400,
                letterSpacing: (widget.selected == true) ? 2 : 1,
                fontSize: (widget.selected == true) ? 15 : 14))
      ]),
    );
  }
}
