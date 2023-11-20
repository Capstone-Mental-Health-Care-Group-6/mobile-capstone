
import 'package:intl/intl.dart';

String get formattedDate =>
    DateFormat('EEEE', 'id').format(DateTime.now());

String get formattedHour => DateFormat('HH.mm').format(DateTime.now());