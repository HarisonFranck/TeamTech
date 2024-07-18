import 'package:flutter/material.dart';
import 'package:responsive_app/Component/FadeImageAsset.dart';
import 'package:responsive_app/Models/Employee.dart';
import 'package:responsive_app/data/local_data/teams.dart';

class OtherWidget {
  List<Employee> employees = listTeams;

  bool isToday(DateTime dt) {
    DateTime now = DateTime.now();
    if ((dt.month == now.month) && (dt.day == now.day)) {
      return true;
    }
    return false;
  }

  List<Employee> oneOreMoreHasBirth(List<Employee> emps) {
    List<Employee> empsBirth = [];
    for (int e = 0; e < emps.length; e++) {
      Employee employee = emps.elementAt(e);
      if (isToday(employee.datenaissance!)) {
        if (!empsBirth.contains(employee)) {
          empsBirth.add(employee);
        }
      }
    }

    return empsBirth;
  }

  List<Employee> empsBirth = [];

  OtherWidget() {
    empsBirth = oneOreMoreHasBirth(employees);
  }

  Widget birthdayWidget(Employee employee) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 50,
                height: 50,
                child: Image.asset(
                  'assets/images/${employee.pathImage}',
                  fit: BoxFit.cover,
                ),
              )),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '${employee.firstName}\'s Birthday',
              textAlign: TextAlign.start,
              style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  letterSpacing: 2,
                  color: Colors.white),
            ),
          ],
        ),
        const Spacer(),
        Padding(
            padding: EdgeInsets.only(right: 10),
            child: FadeImageAsset(pathImage: 'birthday.png'))
      ],
    );
  }

  Widget noneBirthdayWidget() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: 50,
                height: 50,
              )),
        ),
        const SizedBox(
          width: 20,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'No Birthday',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      letterSpacing: 2,
                      color: Colors.white),
                ),
              ],
            ),
            Icon(
              Icons.update,
              color: Colors.white,
            )
          ],
        ),
        const Spacer(),
        Padding(
            padding: EdgeInsets.only(right: 10),
            child: FadeImageAsset(pathImage: 'goodday.png'))
      ],
    );
  }
}
