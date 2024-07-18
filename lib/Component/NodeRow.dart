import 'package:flutter/material.dart';
import 'package:responsive_app/Component/NodeEmployee.dart';
import 'package:responsive_app/Component/RowNode.dart';
import 'package:responsive_app/Models/CustomNode.dart';

class NodeRow extends StatefulWidget {
  final List<CustomNode> nodes;
  const NodeRow({super.key, required this.nodes});

  @override
  State<NodeRow> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NodeRow> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int emp = 0; emp < widget.nodes.length; emp++) ...[
            if (widget.nodes
                .elementAt(emp)
                .employee
                .subordonate
                .isNotEmpty) ...[
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = emp;
                        });
                      },
                      child: NodeEmployee(
                          employee: widget.nodes.elementAt(emp).employee)),
                  if (selectedIndex == emp) ...[
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 65),
                            height: height * 0.245,
                            child: const Center(
                              child: VerticalDivider(
                                color: Colors.black,
                                thickness: 2,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: RowNode(
                              employees: widget.nodes
                                  .elementAt(emp)
                                  .employee
                                  .subordonate),
                        ),
                      ],
                    ),
                  ]
                ],
              )
            ] else ...[
              NodeEmployee(employee: widget.nodes.elementAt(emp).employee),
            ]
          ]
        ],
      ),
    );
  }
}
