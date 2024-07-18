import 'package:flutter/material.dart';
import 'package:responsive_app/Component/NodeEmployee.dart';
import 'package:responsive_app/Models/Employee.dart';

class RowNode extends StatefulWidget {
  final List<Employee> employees;
  const RowNode({super.key, required this.employees});

  @override
  State<RowNode> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RowNode> {
  int selectedIndex = 7;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int emp = 0; emp < widget.employees.length; emp++) ...[
            if (widget.employees.elementAt(emp).subordonate.isNotEmpty) ...[
              Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = emp;
                        });
                      },
                      child: NodeEmployee(
                          employee: widget.employees.elementAt(emp))),
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
                              employees:
                                  widget.employees.elementAt(emp).subordonate),
                        ),
                      ],
                    ),
                  ]
                ],
              ),
              if (emp < widget.employees.length - 1) ...[
                Container(
                  width: width * 0.08,
                  child: const Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                )
              ],
            ] else ...[
              NodeEmployee(employee: widget.employees.elementAt(emp)),
              if (emp < widget.employees.length - 1) ...[
                Container(
                  width: width * 0.08,
                  child: const Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                )
              ],
            ]
          ]
          /*for (int emp = 0; emp < widget.employees.length; emp++) ...[
            NodeEmployee(employee: widget.employees.elementAt(emp)),
            if (emp < widget.employees.length - 1) ...[
              Container(
                width: width * 0.08,
                child: const Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
              )
            ]
          ]*/
        ],
      ),
    );
  }
}
