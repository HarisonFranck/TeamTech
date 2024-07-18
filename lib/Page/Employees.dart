import 'package:flutter/material.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:responsive_app/Component/NodeRow.dart';
import 'package:responsive_app/Component/RowNode.dart';
import 'package:responsive_app/Component/SubNodes.dart';
import 'package:responsive_app/Models/CustomNode.dart';
import 'package:responsive_app/Models/Employee.dart';
import 'package:responsive_app/data/local_data/teams.dart';

class Employees extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return EmployeesState();
  }
}

class EmployeesState extends State<Employees> {
  late TreeViewController _controller;

  List<CustomNode> teamsNode = [];

  Node toNode(Employee employee) {
    return Node(
      label: "${employee.firstName} ${employee.lastName}",
      key: employee.lastName,
      data: employee.pathImage,
      children: employee.subordonate.map(toNode).toList(),
    );
  }

  @override
  void initState() {
    super.initState();
    teamsNode = listNode;

    print('TEAM SIZE : ${teamsNode.length}');

    _controller = TreeViewController(
      children: teamsNode.map((e) => toNode(e.employee)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            const Color.fromARGB(255, 185, 204, 255).withOpacity(0.4),
        appBar: AppBar(
          title: const Text('Employees'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NodeRow(nodes: teamsNode),
            ],
          ),
        ));
  }
}

class LinePainter extends CustomPainter {
  final TreeViewController controller;

  LinePainter(this.controller);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2.0;

    for (var node in controller.children) {
      _drawLines(canvas, node, paint, Offset(size.width / 2, 0),
          Offset(size.width / 2, 50));
    }
  }

  void _drawLines(Canvas canvas, Node node, Paint paint, Offset parentOffset,
      Offset childOffset) {
    for (var child in node.children) {
      final childPos = Offset(childOffset.dx, childOffset.dy + 100);
      canvas.drawLine(parentOffset, childPos, paint);
      _drawLines(canvas, child, paint, childPos, childPos);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
