import 'package:flutter/material.dart';
import 'package:responsive_app/Component/ProjectTile.dart';
import 'package:responsive_app/Models/Employee.dart';

class customTable extends StatefulWidget {
  List<Employee> team = [];

  customTable({required this.team});

  @override
  State<StatefulWidget> createState() {
    return TableState();
  }
}

class TableState extends State<customTable> {
  List<bool> isChecked = [true, false, true, true, false, false, false];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: MediaQuery.of(context).size.height / 3.8,
      child: (width < 1890)
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color.fromARGB(255, 240, 247, 252)),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 7,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            width: 20,
                            height: 20,
                            color: const Color.fromARGB(255, 34, 93, 180),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Text(
                          'Project Name',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 14, 86, 219),
                          ),
                        ),
                        const SizedBox(
                          width: 310,
                        ),
                        const Text(
                          'Estimate-date',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 14, 86, 219),
                          ),
                        ),
                        const SizedBox(
                          width: 150,
                        ),
                        const Text(
                          'Project type',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 14, 86, 219),
                          ),
                        ),
                        const SizedBox(
                          width: 140,
                        ),
                        const Text(
                          'Project team',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 14, 86, 219),
                          ),
                        ),
                        const SizedBox(
                          width: 140,
                        ),
                        const Text(
                          'Project Rate',
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Color.fromARGB(255, 14, 86, 219)),
                        ),
                        const SizedBox(
                          width: 120,
                        ),
                        const Text(
                          'Project status',
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Color.fromARGB(255, 14, 86, 219)),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40, top: 10),
                              child: Checkbox(
                                  checkColor:
                                      const Color.fromARGB(255, 152, 205, 248),
                                  value: isChecked[0],
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked[0] = value!;
                                    });
                                  }),
                            ),
                            ProjectTile(
                                onChangeTile: () {
                                  setState(() {
                                    isChecked[0] = !isChecked[0];
                                  });
                                },
                                isChecked: isChecked[0],
                                projectName: 'Rental app Design',
                                estimateDate: '07Mars-30Mars',
                                projectStatus: 'Ongoing',
                                projectType: 'Product Design',
                                projetRate: 50000,
                                team: widget.team),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40, top: 10),
                              child: Checkbox(
                                  checkColor:
                                      const Color.fromARGB(255, 152, 205, 248),
                                  value: isChecked[1],
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked[1] = value!;
                                    });
                                  }),
                            ),
                            ProjectTile(
                                onChangeTile: () {
                                  setState(() {
                                    isChecked[1] = !isChecked[1];
                                  });
                                },
                                isChecked: isChecked[1],
                                projectName: 'Revamp Website',
                                estimateDate: '11April-20April',
                                projectStatus: 'in Review',
                                projectType: 'UX/UI Design',
                                projetRate: 120000,
                                team: widget.team),
                          ],
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            )
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: const Color.fromARGB(255, 240, 247, 252)),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 7,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: 20,
                          height: 20,
                          color: const Color.fromARGB(255, 34, 93, 180),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Text(
                        'Project Name',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 14, 86, 219),
                        ),
                      ),
                      const SizedBox(
                        width: 310,
                      ),
                      const Text(
                        'Estimate-date',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 14, 86, 219),
                        ),
                      ),
                      const SizedBox(
                        width: 150,
                      ),
                      const Text(
                        'Project type',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 14, 86, 219),
                        ),
                      ),
                      const SizedBox(
                        width: 140,
                      ),
                      const Text(
                        'Project team',
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 14, 86, 219),
                        ),
                      ),
                      const SizedBox(
                        width: 140,
                      ),
                      const Text(
                        'Project Rate',
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Color.fromARGB(255, 14, 86, 219)),
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      const Text(
                        'Project status',
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Color.fromARGB(255, 14, 86, 219)),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40, top: 10),
                            child: Checkbox(
                                checkColor:
                                    const Color.fromARGB(255, 152, 205, 248),
                                value: isChecked[0],
                                onChanged: (value) {
                                  setState(() {
                                    isChecked[0] = value!;
                                  });
                                }),
                          ),
                          ProjectTile(
                              onChangeTile: () {
                                print('CHECKED : $isChecked[0]');
                                setState(() {
                                  isChecked[0] = !isChecked[0];
                                });
                              },
                              isChecked: isChecked[0],
                              projectName: 'Rental app Design',
                              estimateDate: '07Mars-30Mars',
                              projectStatus: 'Ongoing',
                              projectType: 'Product Design',
                              projetRate: 50000,
                              team: widget.team),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40, top: 10),
                            child: Checkbox(
                                checkColor:
                                    const Color.fromARGB(255, 152, 205, 248),
                                value: isChecked[1],
                                onChanged: (value) {
                                  setState(() {
                                    isChecked[1] = value!;
                                  });
                                }),
                          ),
                          ProjectTile(
                              onChangeTile: () {
                                setState(() {
                                  isChecked[1] = !isChecked[1];
                                });
                              },
                              isChecked: isChecked[1],
                              projectName: 'Revamp Website',
                              estimateDate: '11April-20April',
                              projectStatus: 'in Review',
                              projectType: 'UX/UI Design',
                              projetRate: 120000,
                              team: widget.team),
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            ),
    );
  }
}
