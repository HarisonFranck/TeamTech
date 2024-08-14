import 'package:flutter/material.dart';
import 'package:responsive_app/Models/Employee.dart';

class ProjectTile extends StatelessWidget {
  final bool isChecked;
  final String projectName;
  final String estimateDate;
  final String projectType;
  final List<Employee> team;
  final double projetRate;
  final String projectStatus;

  final void Function() onChangeTile;

  ProjectTile(
      {required this.isChecked,
      required this.projectName,
      required this.estimateDate,
      required this.projectStatus,
      required this.projectType,
      required this.projetRate,
      required this.team,
      required this.onChangeTile});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChangeTile,
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 10, right: 20),
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6), color: Colors.transparent),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 250,
              child: Text(
                projectName,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              width: 123,
            ),
            Container(
              height: 30,
              width: 150,
              child: Text(
                textAlign: TextAlign.center,
                estimateDate,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              width: 70,
            ),
            Container(
              height: 30,
              width: 200,
              child: Text(
                projectType,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              width: 60,
            ),
            Container(
                padding: const EdgeInsets.only(left: 15, top: 5),
                width: 130,
                height: 40,
                child: Center(
                  child: Stack(alignment: Alignment.center, children: [
                    for (int member = 0; member < team.length; member++) ...[
                      Positioned(
                          left: (member == 0) ? 1 : member * 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              width: 25,
                              height: 25,
                              child: Image.asset(
                                'assets/images/${team.elementAt(member).pathImage}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                    ],
                  ]),
                )),
            const SizedBox(
              width: 105,
            ),
            Container(
              height: 30,
              width: 100,
              child: Text(
                '\$${projetRate.toString()}',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              width: 105,
            ),
            Container(
                decoration: BoxDecoration(
                    color: (projectStatus.startsWith('O'))
                        ? Color.fromARGB(255, 218, 247, 213)
                        : Color.fromARGB(255, 185, 220, 243),
                    borderRadius: BorderRadius.circular(6)),
                height: 30,
                width: 100,
                child: Center(
                  child: Row(
                    children: [
                      Spacer(),
                      Icon(
                        (projectStatus.startsWith('O'))
                            ? Icons.check
                            : Icons.more_horiz_outlined,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        projectStatus,
                        style: (projectStatus.startsWith('O'))
                            ? TextStyle(
                                color: const Color.fromARGB(255, 10, 82, 13),
                                fontWeight: FontWeight.w500)
                            : TextStyle(
                                color: Color.fromARGB(255, 9, 88, 190),
                                fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
