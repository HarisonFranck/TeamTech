class Utilities {
  String formatTimeAppointmentNotif(
      DateTime startDateTime, DateTime timeStart, DateTime timeEnd) {
    // Liste des jours de la semaine
    final List<String> jours = [
      'Lundi',
      'Mardi',
      'Mercredi',
      'Jeudi',
      'Vendredi',
      'Samedi',
      'Dimanche'
    ];

    // Liste des mois de l'année
    final List<String> mois = [
      '',
      'Janvier',
      'Février',
      'Mars',
      'Avril',
      'Mai',
      'Juin',
      'Juillet',
      'Août',
      'Septembre',
      'Octobre',
      'Novembre',
      'Décembre'
    ];

    // Extraire les composants de la date et de l'heure
    int jour = startDateTime.day;
    int moisIndex = startDateTime.month;
    int annee = startDateTime.year;
    int heureStart = timeStart.hour;
    int minuteStart = timeStart.minute;
    int heureEnd = timeEnd.hour;
    int minuteEnd = timeEnd.minute;

    // Formater le jour de la semaine
    String jourSemaine = jours[startDateTime.weekday - 1];

    // Formater le mois
    String nomMois = mois[moisIndex];

    // Formater l'heure
    String formatHeureStart =
        '${heureStart.toString().padLeft(2, '0')}:${minuteStart.toString().padLeft(2, '0')}';
    String formatHeureEnd =
        '${heureEnd.toString().padLeft(2, '0')}:${minuteEnd.toString().padLeft(2, '0')}';

    // Construire la chaîne lisible
    String resultat = '$jourSemaine - $formatHeureEnd';

    return resultat;
  }
}
