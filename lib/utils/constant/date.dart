
import 'package:intl/intl.dart';

String getFormattedDateRiwayat(DateTime specificDate) {
  return DateFormat('dd MMM, HH:mm', 'id').format(specificDate);
}


String get formattedDate =>
    DateFormat('EEEE', 'id').format(DateTime.now());

String get formattedHour => DateFormat('HH.mm').format(DateTime.now());

