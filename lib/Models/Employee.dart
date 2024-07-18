import 'package:responsive_app/Models/Genre.dart';
import 'package:responsive_app/Models/Occupation.dart';

class Employee {
  final String pathImage;
  final String lastName;
  final String firstName;
  final Genre genre;
  final Occupation occupation;
  DateTime? datenaissance;
  final List<Employee> subordonate;

  Employee(
      {required this.pathImage,
      required this.lastName,
      required this.firstName,
      required this.occupation,
      required this.genre,
      this.datenaissance,
      required this.subordonate});
}
