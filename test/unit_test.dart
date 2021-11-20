import 'package:articles_app/util/utility.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('year calculateTimeRange test', () {
    var dateTime = DateTime(DateTime.now().year - 2, 1, 1);
    var difference = Utility.calculateTimeRange(dateTime);
    
    expect(difference.contains('Year'), true);
  });

  test('month calculateTimeRange test', () {
    var dateTime = DateTime(DateTime.now().year, DateTime.now().month - 3, 1);
    var difference = Utility.calculateTimeRange(dateTime);
    
    expect(difference.contains('Month'), true);
  });

  test('day calculateTimeRange test', () {
    var dateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 3);
    var difference = Utility.calculateTimeRange(dateTime);
    
    expect(difference.contains('Days'), true);
  });

  test('hour calculateTimeRange test', () {
    var dateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, DateTime.now().hour - 3);
    var difference = Utility.calculateTimeRange(dateTime);
    
    expect(difference.contains('Hours'), true);
  });

}