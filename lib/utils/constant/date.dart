import 'package:intl/intl.dart';

String getFormattedDateRiwayat(DateTime specificDate) {
  return DateFormat('dd MMM, HH:mm', 'id').format(specificDate);
}
