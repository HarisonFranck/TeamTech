import 'package:flutter/material.dart';
import 'package:responsive_app/Models/SalesData.dart';

class SplineDataSeries {
  List<SalesData> dataSource;
  final Color colorSpline;
  SplineDataSeries({required this.dataSource, required this.colorSpline});

  void setData() {
    this.dataSource = [
      SalesData(dateTime: DateTime(2024, 1, 01), sales: 30000),
      SalesData(dateTime: DateTime(2024, 3, 01), sales: 40000),
      SalesData(dateTime: DateTime(2024, 4, 01), sales: 48000),
      SalesData(dateTime: DateTime(2024, 07, 10), sales: 10000),
      SalesData(dateTime: DateTime(2024, 09, 10), sales: 32000),
      SalesData(dateTime: DateTime(2024, 11, 10), sales: 16000),
      SalesData(dateTime: DateTime(2024, 12, 20), sales: 25000),
    ];
  }
}
