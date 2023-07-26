import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  late final String locale;
  late ExpectedDate expectedDate;
  setUpAll(() {
    locale = 'pt_BR';
    initializeDateFormatting(locale);
  });
  test('Formatting date', () {
    expectedDate = ExpectedDate(
      date: DateTime.parse('2023-07-15'),
      fullDate: '15 de julho de 2023',
    );
    final dateFormat = DateFormat.yMMMMd(locale);
    final formattedDate = dateFormat.format(expectedDate.date);
    expect(
      formattedDate,
      expectedDate.fullDate,
    );
  });
}

class ExpectedDate {
  final DateTime date;
  final String fullDate;

  const ExpectedDate({
    required this.date,
    required this.fullDate,
  });
}
