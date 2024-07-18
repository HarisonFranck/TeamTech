import 'package:flutter/material.dart';
import 'package:responsive_app/Models/Employee.dart';

class NodeEmployee extends StatelessWidget {
  final Employee employee;
  const NodeEmployee({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/${employee.pathImage}'))),
          ),
          Container(
            width: 120,
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                '${employee.occupation.name}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 3),
              ),
            ),
          ),
          Center(
            child: Text(
              (employee.genre.id == 0)
                  ? 'Mr ${employee.firstName}'
                  : 'Mme ${employee.firstName}',
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
