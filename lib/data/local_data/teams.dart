import 'package:responsive_app/Models/CustomNode.dart';
import 'package:responsive_app/Models/Employee.dart';
import 'package:responsive_app/Models/Genre.dart';
import 'package:responsive_app/Models/Occupation.dart';

List<Employee> listTeams = [
  Employee(
      pathImage: 'homme1.jpg',
      lastName: 'Jean',
      firstName: 'Eric',
      genre: Genre(id: 0, nom: 'Homme'),
      datenaissance: DateTime(2001, 02, 28),
      occupation: Occupation(name: 'Designer', salaryGrid: '1000\$-25000\$'),
      subordonate: [
        Employee(
            pathImage: 'femme1.jpg',
            lastName: 'Andriamintantsoa',
            firstName: 'Finaritra',
            genre: Genre(id: 1, nom: 'Femme'),
            datenaissance: DateTime(2001, 06, 29),
            occupation: Occupation(
                name: 'Flutter Developer', salaryGrid: '4500\$-6000\$'),
            subordonate: []),
        Employee(
            pathImage: 'homme2.jpg',
            lastName: 'Henikaja',
            firstName: 'Haritiana',
            genre: Genre(id: 0, nom: 'Homme'),
            datenaissance: DateTime(2000, 06, 29),
            occupation:
                Occupation(name: 'Product Owner', salaryGrid: '2000\$-3000\$'),
            subordonate: []),
      ]),
  Employee(
      pathImage: 'femme2.jpg',
      lastName: 'Fanambinantsoa',
      firstName: 'Prisca',
      genre: Genre(id: 1, nom: 'Femme'),
      datenaissance: DateTime(2000, 11, 20),
      occupation: Occupation(name: 'Designer', salaryGrid: '1000\$-25000\$'),
      subordonate: []),
  Employee(
      pathImage: 'homme3.jpg',
      lastName: 'Henikaja',
      firstName: 'Haritiana',
      genre: Genre(id: 0, nom: 'Homme'),
      datenaissance: DateTime(2000, 06, 29),
      occupation:
          Occupation(name: 'Product Owner', salaryGrid: '2000\$-3000\$'),
      subordonate: []),
  Employee(
      pathImage: 'femme3.jpg',
      lastName: 'Andriamintantsoa',
      firstName: 'Finaritra',
      genre: Genre(id: 1, nom: 'Femme'),
      datenaissance: DateTime(2001, 06, 29),
      occupation:
          Occupation(name: 'Flutter Developer', salaryGrid: '4500\$-6000\$'),
      subordonate: []),
];

List<int> long = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
List<int> large = [...long];

List<CustomNode> listNode = [
  CustomNode(
    pointer: {'0': 0},
    employee: Employee(
        pathImage: 'homme4.jpg',
        lastName: 'Jean',
        firstName: 'Eric',
        genre: Genre(id: 0, nom: 'Homme'),
        datenaissance: DateTime(2001, 02, 28),
        occupation:
            Occupation(name: 'Project Manager', salaryGrid: '1000\$-25000\$'),
        subordonate: [
          Employee(
              pathImage: 'femme4.jpg',
              lastName: 'Andriamintantsoa',
              firstName: 'Finaritra',
              genre: Genre(id: 1, nom: 'Femme'),
              datenaissance: DateTime(2001, 06, 29),
              occupation: Occupation(
                  name: 'Flutter Developer', salaryGrid: '4500\$-6000\$'),
              subordonate: []),
          Employee(
              pathImage: 'homme5.jpg',
              lastName: 'Fenosoa',
              firstName: 'Jean',
              genre: Genre(id: 0, nom: 'Homme'),
              datenaissance: DateTime(2000, 06, 29),
              occupation:
                  Occupation(name: 'Designer', salaryGrid: '2000\$-3000\$'),
              subordonate: [
                Employee(
                    pathImage: 'femme7.jpg',
                    lastName: 'Andriamintantsoa',
                    firstName: 'Finaritra',
                    genre: Genre(id: 1, nom: 'Femme'),
                    datenaissance: DateTime(2001, 06, 29),
                    occupation: Occupation(
                        name: 'Flutter Developer', salaryGrid: '4500\$-6000\$'),
                    subordonate: []),
              ]),
          Employee(
              pathImage: 'femme6.jpg',
              lastName: 'Andriamintantsoa',
              firstName: 'Finaritra',
              genre: Genre(id: 1, nom: 'Femme'),
              datenaissance: DateTime(2001, 06, 29),
              occupation: Occupation(
                  name: 'Flutter Developer', salaryGrid: '4500\$-6000\$'),
              subordonate: []),
        ]),
  ),
  CustomNode(
    pointer: {'1': 0},
    employee: Employee(
        pathImage: 'femme8.jpg',
        lastName: 'Fanambinantsoa',
        firstName: 'Prisca',
        genre: Genre(id: 1, nom: 'Femme'),
        datenaissance: DateTime(2000, 11, 20),
        occupation: Occupation(name: 'Designer', salaryGrid: '1000\$-25000\$'),
        subordonate: [
          Employee(
              pathImage: 'femme6.jpg',
              lastName: 'Andriamintantsoa',
              firstName: 'Finaritra',
              genre: Genre(id: 1, nom: 'Femme'),
              datenaissance: DateTime(2001, 06, 29),
              occupation: Occupation(
                  name: 'Flutter Developer', salaryGrid: '4500\$-6000\$'),
              subordonate: []),
          Employee(
              pathImage: 'homme7.jpg',
              lastName: 'Henikaja',
              firstName: 'Haritiana',
              genre: Genre(id: 0, nom: 'Homme'),
              datenaissance: DateTime(2000, 06, 29),
              occupation: Occupation(
                  name: 'Product Owner', salaryGrid: '2000\$-3000\$'),
              subordonate: []),
        ]),
  ),
  CustomNode(
    pointer: {'2': 0},
    employee: Employee(
        pathImage: 'homme8.jpg',
        lastName: 'Henikaja',
        firstName: 'Haritiana',
        genre: Genre(id: 0, nom: 'Homme'),
        datenaissance: DateTime(2000, 06, 29),
        occupation:
            Occupation(name: 'Product Owner', salaryGrid: '2000\$-3000\$'),
        subordonate: []),
  ),
  CustomNode(
    pointer: {'3': 0},
    employee: Employee(
        pathImage: 'femme7.jpg',
        lastName: 'Andriamintantsoa',
        firstName: 'Finaritra',
        genre: Genre(id: 1, nom: 'Femme'),
        datenaissance: DateTime(2001, 06, 29),
        occupation:
            Occupation(name: 'Flutter Developer', salaryGrid: '4500\$-6000\$'),
        subordonate: []),
  )
];
