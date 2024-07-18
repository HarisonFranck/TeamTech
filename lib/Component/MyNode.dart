import 'package:flutter/material.dart';
import 'package:responsive_app/Component/NodeEmployee.dart';
import 'package:responsive_app/Models/Employee.dart';

class MyNode extends StatefulWidget {
  final List<Employee> employees;
  const MyNode({required this.employees, super.key});

  @override
  State<MyNode> createState() => _MyNodeState();
}

class _MyNodeState extends State<MyNode> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int emp = 0; emp < widget.employees.length; emp++) ...[
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
          ]
        ],
      ),
    );
  }
}
