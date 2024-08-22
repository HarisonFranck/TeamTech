import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmployeeTile extends StatelessWidget {
  final String pathImage;
  final String title;
  final String subtitle;
  final bool employeeState;
  DateTime? datenaissance;

  EmployeeTile(
      {required this.pathImage,
      required this.title,
      required this.subtitle,
      this.datenaissance,
      required this.employeeState});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    print('width EM: $width');

    return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            (width < 1790)
                ? Wrap(
                    spacing: 10,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: (width < 1790) ? 5 : 20, right: 20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                'assets/images/$pathImage',
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                      SizedBox(
                        width: (width < 1790) ? 0 : 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(title, textAlign: TextAlign.start),
                          Text(
                            subtitle,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black.withOpacity(0.4)),
                          )
                        ],
                      ),
                      const Spacer(),
                      (employeeState)
                          ? const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.check_circle_outline_outlined,
                                color: Colors.teal,
                              ),
                            )
                          : const Icon(Icons.disabled_by_default_outlined,
                              color: Color.fromARGB(255, 236, 136, 129)),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: TextButton(
                          onPressed: () {
                            employeeState != employeeState;
                          },
                          child: Text(
                            (employeeState) ? 'active' : 'inactive',
                            style: const TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  )
                : Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                'assets/images/$pathImage',
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(title, textAlign: TextAlign.start),
                          Text(
                            subtitle,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black.withOpacity(0.4)),
                          )
                        ],
                      ),
                      const Spacer(),
                      (employeeState)
                          ? const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.check_circle_outline_outlined,
                                color: Colors.teal,
                              ),
                            )
                          : const Icon(Icons.disabled_by_default_outlined,
                              color: Color.fromARGB(255, 236, 136, 129)),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: TextButton(
                          onPressed: () {
                            employeeState != employeeState;
                          },
                          child: Text(
                            (employeeState) ? 'active' : 'inactive',
                            style: const TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
            Divider(
              thickness: 0.6,
              color: Colors.black.withOpacity(0.3),
              indent: 50,
              endIndent: 50,
            )
          ],
        ));
  }
}

List<EmployeeTile> listTile = [
  EmployeeTile(
      pathImage: 'med1.jpg',
      title: 'Mamiandrisoa Fifaliana',
      subtitle: 'Developpeur React',
      employeeState: true),
  EmployeeTile(
      pathImage: 'med2.jpg',
      title: 'Fenohasina Jhon',
      subtitle: 'Developpeur Flutter',
      employeeState: true),
  EmployeeTile(
      pathImage: 'med11.jpg',
      title: 'Andritiana Zo',
      subtitle: 'Product Owner',
      employeeState: false),
  EmployeeTile(
      pathImage: 'med6.jpg',
      title: 'Valisoa Tinah',
      subtitle: 'Informaticien',
      employeeState: false),
  EmployeeTile(
      pathImage: 'med15.jpg',
      title: 'Mamitiana Sandy',
      subtitle: 'Ressource Humaine',
      employeeState: true),
  EmployeeTile(
      pathImage: 'med9.jpg',
      title: 'Mamiandrisoa Kanto',
      subtitle: 'Controle de gestion',
      employeeState: true),
  EmployeeTile(
      pathImage: 'med14.jpg',
      title: 'Andonirina Fitia',
      subtitle: 'Controle de gestion',
      employeeState: true),
  EmployeeTile(
      pathImage: 'med15.jpg',
      title: 'Kantoniaina Johane',
      subtitle: 'Controle de gestion',
      employeeState: true),
  EmployeeTile(
      pathImage: 'med9.jpg',
      title: 'Germain Jin',
      subtitle: 'Designer',
      employeeState: true),
];
