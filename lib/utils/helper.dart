import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ConnexistHelper {
  static String formatCurrency(double number) {
    final NumberFormat format = NumberFormat.currency(locale: 'id', symbol: '');
    String s = format.format(number);
    String _format = s.toString().replaceAll(RegExp(r"([,]*00)(?!.*\d)"), "");
    return _format;
  }

  static String formatDate(DateTime dateTime) {
    initializeDateFormatting("id");
    return DateFormat.yMMMMEEEEd("id").format(dateTime);
  }
}
