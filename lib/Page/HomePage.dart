import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:responsive_app/Component/SideBar.dart';
import 'package:responsive_app/Page/Dashboard.dart';
import 'package:responsive_app/Page/Messages.dart';
import 'package:responsive_app/Page/Payments.dart';
import 'package:responsive_app/Page/Project.dart';
import 'package:responsive_app/Page/Reports.dart';
import 'package:responsive_app/Page/Settings.dart';
import 'package:responsive_app/Page/Events.dart' as Evt;
import 'package:responsive_app/Page/Employees.dart';
import 'package:responsive_app/data/SideBarItem_Data.dart';

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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int selected = 0;

  int selectedIcon = 0;

  bool isSelected = false;

  List<bool> selectionner = [];

  void onChange(int position, List<bool> list) {
    for (int b = 0; b < list.length; b++) {
      if (b == position) {
        list[b] = true;
      } else {
        list[b] = false;
      }
    }
  }

  List<SideBar> sideBars = [];

  @override
  void didChangeDependencies() {
    // TODO: implement initState
    super.didChangeDependencies();
    if (mounted) {
      setState(() {
        selectionner = listSelectionner;

        sideBars = listSideBars;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: isMobile
          ? Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 40),
              decoration: const BoxDecoration(
                  color: Colors.black26,
                  image: DecorationImage(
                      image: AssetImage("assets/screenshott.jpg"),
                      fit: BoxFit.cover)),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.white.withOpacity(0.3)),
                            ),
                            child: Wrap(
                                runAlignment: WrapAlignment.center,
                                alignment: WrapAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selected = 0;
                                        });
                                      },
                                      child: Container(
                                        width: 70,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            color: (selected == 0)
                                                ? Colors.white.withOpacity(0.4)
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: const Icon(
                                          Icons.home,
                                          size: 40,
                                        ),
                                      )),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selected = 1;
                                        });
                                      },
                                      child: Container(
                                        width: 70,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            color: (selected == 1)
                                                ? Colors.white.withOpacity(0.4)
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: const Icon(
                                          Icons.search,
                                          size: 40,
                                        ),
                                      )),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selected = 2;
                                        });
                                      },
                                      child: Container(
                                        width: 70,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            color: (selected == 2)
                                                ? Colors.white.withOpacity(0.4)
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: const Icon(
                                          Icons.settings,
                                          size: 40,
                                        ),
                                      )),
                                ]),
                          ),
                        )),
                  ),
                  AnimatedContainer(
                    curve: Curves.easeInOut,
                    duration: const Duration(seconds: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 200,
                    child: Center(
                      child: (selected == 0)
                          ? Dashboard()
                          : (selected == 1)
                              ? const Payments()
                              : const Settings(),
                    ),
                  ),
                ],
              ))
          : Row(
              children: [
                Container(
                  width: 250,
                  height: MediaQuery.of(context).size.height,
                  color: const Color.fromARGB(255, 7, 23, 54),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Center(
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.amberAccent, width: 1),
                                    borderRadius: BorderRadius.circular(6)),
                                width: 150,
                                height: 120,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/logo.png',
                                      fit: BoxFit.cover,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Tech-Innov',
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.white,
                                            letterSpacing: 2,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ))),
                      ),
                      for (int side = 0; side < sideBars.length; side++) ...[
                        Align(
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                onChange(side, selectionner);
                                selected = side;
                              });

                              print('SIDEBAR: ${side}');
                            },
                            child: Container(
                              width: 250,
                              height: 80,
                              decoration: BoxDecoration(
                                  gradient: (selectionner[side] == true)
                                      ? LinearGradient(colors: [
                                          Colors.white.withOpacity(0.05),
                                          Colors.white.withOpacity(0.3),
                                        ])
                                      : null),
                              child: Row(children: [
                                const SizedBox(
                                  width: 30,
                                ),
                                (selectionner[side])
                                    ? RotatingWidget(
                                        child: sideBars[side].sideBarIcons)
                                    : sideBars[side].sideBarIcons,
                                const SizedBox(
                                  width: 40,
                                ),
                                Text('${sideBars[side].sideBarTitles}',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                        fontWeight: (selectionner[side] == true)
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                        letterSpacing:
                                            (selectionner[side] == true)
                                                ? 2
                                                : 1,
                                        fontSize: (selectionner[side] == true)
                                            ? 15
                                            : 14))
                              ]),
                            ),
                          ),
                        )
                      ]
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 228, 228, 228),
                        ),
                        child: (selected == 0)
                            ? Dashboard()
                            : (selected == 1)
                                ? Project()
                                : (selected == 2)
                                    ? Messages()
                                    : (selected == 3)
                                        ? Evt.Events()
                                        : (selected == 4)
                                            ? Employees()
                                            : (selected == 5)
                                                ? Reports()
                                                : const Payments()))
              ],
            ),
    );
  }
}
