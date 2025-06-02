import 'package:intl/intl.dart';

String convertToAgo(DateTime? input) {
  if (input == null) {
    return 'Invalid date';
  }
  Duration diff = DateTime.now().difference(input);
  final numDays = diff.inDays;
  if (numDays >= 365) {
    final numYears = (numDays / 365).floor();
    return numYears == 1 ? '1 tahun yang lalu' : '$numYears tahun yang lalu';
  } else if (numDays >= 30) {
    final numMonths = (numDays / 30).floor();
    return numMonths == 1 ? '1 bulan yang lalu' : '$numMonths bulan yang lalu';
  } else if (numDays >= 7) {
    final numWeeks = (numDays / 7).floor();
    return numWeeks == 1 ? '1 minggu yang lalu' : '$numWeeks minggu yang lalu';
  } else if (numDays >= 1) {
    return numDays == 1 ? '1 hari yang lalu' : '$numDays hari yang lalu';
  } else if (diff.inHours >= 1) {
    final numHours = diff.inHours;
    return numHours == 1 ? '1 jam yang lalu' : '$numHours jam yang lalu';
  } else if (diff.inMinutes >= 1) {
    final numMinutes = diff.inMinutes;
    return numMinutes == 1
        ? '1 menit yang lalu'
        : '$numMinutes menit yang lalu';
  } else {
    return 'Sekarang';
  }
}

String formatTimeAgo(String dateTime) {
  DateTime time = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTime);
  Duration diff = DateTime.now().difference(time);

  if (diff.inMinutes < 60) {
    return "${diff.inMinutes} Menit";
  } else if (diff.inHours < 24) {
    return "${diff.inHours} Jam";
  } else if (diff.inDays == 1) {
    return "Kemarin";
  } else if (diff.inDays <= 7) {
    return "${diff.inDays} Hari";
  } else {
    return DateFormat("dd MMM yyyy").format(time);
  }
}
