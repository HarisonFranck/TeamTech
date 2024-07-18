import 'package:flutter/material.dart';
import 'package:responsive_app/Component/NodeRow.dart';
import 'package:responsive_app/Models/CustomNode.dart';

class SubNodes extends StatefulWidget {
  final List<CustomNode> nodes;
  const SubNodes({required this.nodes, super.key});

  @override
  State<SubNodes> createState() => _SubNodesState();
}

class _SubNodesState extends State<SubNodes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      color: Colors.amber,
      child: (widget.nodes.isNotEmpty) ? NodeRow(nodes: widget.nodes) : null,
    );
  }
}
