import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_app/Component/EmployeeTile.dart';
import 'package:responsive_app/Component/HomeCard.dart';
import 'package:responsive_app/Component/OtherWidget.dart';
import 'package:responsive_app/Component/ProjectTile.dart';
import 'package:responsive_app/Models/Employee.dart';
import 'package:responsive_app/Models/Occupation.dart';
import 'package:responsive_app/Models/SalesData.dart';
import 'package:responsive_app/data/local_data/teams.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  List<bool> isChecked = [true, false, true, true, false, false, false];

  List<Employee> teams = [];

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    teams = listTeams;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print('WIDTH: $width');
    //bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 185, 204, 255).withOpacity(0.4),
      appBar: AppBar(
        forceMaterialTransparency: false,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
                width: 400,
                height: 50,
                padding: const EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,
                        color: Colors.black.withOpacity(0.8)),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 210, 234, 253),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 0, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(6)),
                    hintText: 'Search for project or anythings...',
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.notifications)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: 30,
                height: 30,
                color: const Color.fromARGB(255, 94, 175, 241),
                child: const Center(
                  child: Text(
                    'MF',
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Mauriat Franck',
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  color: Colors.black.withOpacity(0.5)),
            ),
          ),
          PopupMenuButton(
              icon: const Icon(
                Icons.arrow_drop_down_rounded,
                size: 40,
              ),
              itemBuilder: (context) => <PopupMenuItem<Widget>>[
                    PopupMenuItem(
                      onTap: () {
                        print('Profile taped');
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Profile'), Icon(Icons.person)],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        print('Logout taped');
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('logout'), Icon(Icons.logout)],
                      ),
                    ),
                  ])
        ],
      ),
      body: ListView(children: [
        const Padding(
          padding: EdgeInsets.only(left: 60, top: 20, bottom: 10),
          child: Text(
            'Welcome back, Actor',
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 17,
                fontWeight: FontWeight.w500,
                letterSpacing: 2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60, bottom: 20),
          child: Text(
            'Dashboard Overview',
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 2,
                color: const Color.fromARGB(255, 7, 23, 54).withOpacity(0.6)),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Wrap(
              direction: Axis.horizontal,
              runSpacing: 30,
              spacing: 20,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.7,
                  height: MediaQuery.of(context).size.height / 1.5,
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runSpacing: 40,
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            HomeCard(
                              containerWidth: (width >= 1600) ? 300 : null,
                              typeCard: 'Employees',
                              value: '103',
                              pourcent: 5.2,
                              state: 'Active workers',
                              cardContainerIconColor:
                                  const Color.fromARGB(255, 196, 226, 250),
                              cardIcon: const Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 1, 101, 184),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            HomeCard(
                              containerWidth: (width >= 1600) ? 300 : null,
                              typeCard: 'Projects',
                              value: '205',
                              pourcent: 11.9,
                              state: 'Avalaible projects',
                              cardContainerIconColor:
                                  const Color.fromARGB(255, 252, 221, 203),
                              cardIcon: const Icon(
                                Icons.bar_chart_rounded,
                                color: Color.fromARGB(255, 255, 105, 18),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            HomeCard(
                              containerWidth: (width >= 1600) ? 300 : null,
                              typeCard: 'Clients',
                              value: '46+',
                              pourcent: 11.9,
                              state: 'Avalaible clients',
                              cardContainerIconColor:
                                  const Color.fromARGB(255, 253, 196, 196),
                              cardIcon: const Icon(
                                Icons.person_2,
                                color: Color.fromARGB(255, 250, 98, 98),
                              ),
                            ),
                            /*if (width >= 1600) ...[
                              HomeCard(
                                containerWidth: (width >= 1600) ? 300 : null,
                                typeCard: 'Clients',
                                value: '46+',
                                pourcent: 11.9,
                                state: 'Avalaible clients',
                                cardContainerIconColor:
                                    const Color.fromARGB(255, 253, 196, 196),
                                cardIcon: const Icon(
                                  Icons.person_2,
                                  color: Color.fromARGB(255, 250, 98, 98),
                                ),
                              ),
                            ],*/
                          ],
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin:
                            const EdgeInsets.only(top: 40, left: 30, right: 30),
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(6)),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.topLeft,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(top: 20, left: 20),
                                        child: Text(
                                          'Salary Analytics',
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: SfCartesianChart(
                                    trackballBehavior: TrackballBehavior(
                                      enable: true,
                                      shouldAlwaysShow: true,
                                      activationMode: ActivationMode.singleTap,
                                      lineColor:
                                          Colors.blueAccent.withOpacity(0.6),
                                      lineDashArray: const <double>[5, 5],
                                      lineWidth: 1,
                                      builder: (BuildContext context,
                                          TrackballDetails trackballDetails) {
                                        // Format des heures et minutes
                                        final DateTime dateTime =
                                            trackballDetails.point!.x
                                                as DateTime;

                                        return Container(
                                          height: 60,
                                          width: 90,
                                          decoration: const BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 29, 51, 99),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6.0)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                '${trackballDetails.point!.y} €', // Utilisation du formatter pour formater la valeur
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                DateFormat('yyyy-MM-dd').format(
                                                    dateTime), // Utilisation du formatter pour formater la date
                                                style: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    crosshairBehavior: CrosshairBehavior(
                                        enable: true,
                                        lineColor: Colors.red,
                                        lineType: CrosshairLineType.horizontal,
                                        shouldAlwaysShow: true),
                                    zoomPanBehavior: ZoomPanBehavior(
                                        enablePanning: true,
                                        enableDoubleTapZooming: true,
                                        enableSelectionZooming: true,
                                        enableMouseWheelZooming: true,
                                        enablePinching: true),
                                    tooltipBehavior: TooltipBehavior(
                                        header: 'Salary',
                                        shared: true,
                                        shouldAlwaysShow: false,
                                        enable: false),
                                    isTransposed: false,
                                    selectionGesture: ActivationMode.singleTap,
                                    onLegendTapped: (legendTapArgs) {
                                      print('${legendTapArgs.series}');
                                    },
                                    legend: Legend(
                                        isVisible: true,
                                        isResponsive: true,
                                        legendItemBuilder: (legendText, series,
                                                point, seriesIndex) =>
                                            Wrap(
                                              children: [
                                                Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color: series!.color,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              3)),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                (seriesIndex == 0)
                                                    ? const Text('This month')
                                                    : const Text('Last month')
                                              ],
                                            )),
                                    title: const ChartTitle(
                                        text: 'Salary analytics'),
                                    selectionType: SelectionType.series,
                                    primaryXAxis: DateTimeAxis(
                                      intervalType: DateTimeIntervalType.months,
                                      minimum: DateTime(2024, 1, 15),
                                      maximum: DateTime(2024, 12, 15),
                                    ),
                                    primaryYAxis: const NumericAxis(
                                      minimum: 0,
                                      maximum: 50000,
                                    ),
                                    series: <SplineSeries<SalesData, DateTime>>[
                                      SplineSeries<SalesData, DateTime>(
                                        color: const Color.fromARGB(
                                            255, 124, 29, 153),
                                        dataSource: [
                                          SalesData(
                                              dateTime: DateTime(2024, 1, 01),
                                              sales: 30000),
                                          SalesData(
                                              dateTime: DateTime(2024, 3, 01),
                                              sales: 40000),
                                          SalesData(
                                              dateTime: DateTime(2024, 4, 01),
                                              sales: 48000),
                                          SalesData(
                                              dateTime: DateTime(2024, 07, 10),
                                              sales: 10000),
                                          SalesData(
                                              dateTime: DateTime(2024, 09, 10),
                                              sales: 32000),
                                          SalesData(
                                              dateTime: DateTime(2024, 11, 10),
                                              sales: 16000),
                                          SalesData(
                                              dateTime: DateTime(2024, 12, 20),
                                              sales: 25000),
                                        ],
                                        xValueMapper: (SalesData sales, _) =>
                                            sales.dateTime,
                                        yValueMapper: (SalesData sales, _) =>
                                            sales.sales,
                                      ),
                                      SplineSeries<SalesData, DateTime>(
                                        color: const Color.fromARGB(
                                            255, 44, 161, 48),
                                        dataSource: [
                                          SalesData(
                                              dateTime: DateTime(2024, 1, 01),
                                              sales: 10000),
                                          SalesData(
                                              dateTime: DateTime(2024, 07, 10),
                                              sales: 20000),
                                          SalesData(
                                              dateTime: DateTime(2024, 09, 10),
                                              sales: 32000),
                                          SalesData(
                                              dateTime: DateTime(2024, 11, 10),
                                              sales: 10000),
                                          SalesData(
                                              dateTime: DateTime(2024, 11, 20),
                                              sales: 25000),
                                        ],
                                        xValueMapper: (SalesData sales, _) =>
                                            sales.dateTime,
                                        yValueMapper: (SalesData sales, _) =>
                                            sales.sales,
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            )),
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: (width < 1850) ? 30 : 0,
                  ),
                  child: Container(
                    width: (width < 1895)
                        ? MediaQuery.of(context).size.width / 4
                        : MediaQuery.of(context).size.width / 4.4,
                    height: MediaQuery.of(context).size.height / 1.5,
                    padding: const EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    child: Column(
                      children: [
                        Container(
                          height: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: const Color.fromARGB(255, 15, 33, 53)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      'Today\'s birthday',
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.white),
                                    ),
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: PopupMenuButton(
                                        icon: const Icon(
                                          Icons.more_horiz,
                                          color: Color.fromARGB(
                                              255, 199, 199, 199),
                                        ),
                                        itemBuilder: (context) =>
                                            <PopupMenuItem<Widget>>[
                                              PopupMenuItem(
                                                  onTap: () {
                                                    print('VIEW BIRTHDAY');
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text(
                                                        'Details',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ),
                                                      Icon(
                                                        Icons.view_comfortable,
                                                        color: Colors.black
                                                            .withOpacity(0.8),
                                                      )
                                                    ],
                                                  )),
                                              PopupMenuItem(
                                                  onTap: () {
                                                    print('CLOSE BIRTHDAY');
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      const Text('Close'),
                                                      Icon(
                                                        Icons.close,
                                                        color: Colors.black
                                                            .withOpacity(0.8),
                                                      )
                                                    ],
                                                  )),
                                            ]),
                                  )
                                ],
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 10, top: 15),
                                  child: oneOreMoreHasBirth(teams).isNotEmpty
                                      ? SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              for (int emp = 0;
                                                  emp <
                                                      oneOreMoreHasBirth(teams)
                                                          .length;
                                                  emp++) ...[
                                                OtherWidget().birthdayWidget(
                                                    oneOreMoreHasBirth(teams)
                                                        .elementAt(emp)),
                                                if (emp !=
                                                    oneOreMoreHasBirth(teams)
                                                            .length -
                                                        1) ...[
                                                  Divider(
                                                    thickness: 1,
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                    indent: 5,
                                                    endIndent: 5,
                                                  )
                                                ]
                                              ]
                                            ],
                                          ),
                                        )
                                      : OtherWidget().noneBirthdayWidget(),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Expanded(
                            child: Container(
                                width: 500,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                child: Column(
                                  children: [
                                    const Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 20, top: 20),
                                          child: Text(
                                            'Team Analytics',
                                            style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Expanded(
                                        child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
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
                                          ]),
                                    ))
                                  ],
                                )))
                      ],
                    ),
                  ),
                )
              ],
            )),
        Container(
          margin:
              const EdgeInsets.only(left: 60, right: 55, bottom: 30, top: 40),
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(6)),
          child: Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'Project Overview',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        print('Export');
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.cloud_download_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Export')
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {
                        print('Share');
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.share),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Share')
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: PopupMenuButton(
                        icon: const Icon(
                          Icons.more_horiz_rounded,
                          color: Colors.grey,
                        ),
                        itemBuilder: (context) => <PopupMenuItem<Widget>>[
                              const PopupMenuItem(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [Icon(Icons.sort), Text('Sort')],
                              )),
                              const PopupMenuItem(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.linear_scale_sharp),
                                  Text('Linear')
                                ],
                              ))
                            ]),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3.8,
                child: (width < 1890)
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 20, right: 20),
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color:
                                      const Color.fromARGB(255, 240, 247, 252)),
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
                                      color: const Color.fromARGB(
                                          255, 34, 93, 180),
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
                                        color:
                                            Color.fromARGB(255, 14, 86, 219)),
                                  ),
                                  const SizedBox(
                                    width: 120,
                                  ),
                                  const Text(
                                    'Project status',
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color:
                                            Color.fromARGB(255, 14, 86, 219)),
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
                                        padding: const EdgeInsets.only(
                                            left: 40, top: 10),
                                        child: Checkbox(
                                            checkColor: const Color.fromARGB(
                                                255, 152, 205, 248),
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
                                          team: teams),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40, top: 10),
                                        child: Checkbox(
                                            checkColor: const Color.fromARGB(
                                                255, 152, 205, 248),
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
                                          team: teams),
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
                            margin: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color:
                                    const Color.fromARGB(255, 240, 247, 252)),
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
                                    color:
                                        const Color.fromARGB(255, 34, 93, 180),
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
                                      padding: const EdgeInsets.only(
                                          left: 40, top: 10),
                                      child: Checkbox(
                                          checkColor: const Color.fromARGB(
                                              255, 152, 205, 248),
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
                                        team: teams),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40, top: 10),
                                      child: Checkbox(
                                          checkColor: const Color.fromARGB(
                                              255, 152, 205, 248),
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
                                        team: teams),
                                  ],
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
