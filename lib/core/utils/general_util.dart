import 'package:intl/intl.dart';

class GeneralUtils {
  final NumberFormat fCurrency = NumberFormat('#,###', 'id_ID');
  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  String intToCurrency(int? inputNumber) {
    if (null == inputNumber) {
      return 'Rp 0';
    }
    return 'Rp ' + fCurrency.format(inputNumber);
  }
}
