import 'package:articles_app/config/config.dart';

class Utility {

  static String calculateTimeRange(DateTime dateTime) {
    var now = DateTime.now();

    var monthDifference = (now.difference(dateTime).inDays / 30).round();
    var daysDifference = now.difference(dateTime).inDays;
    var hourDifference = now.difference(dateTime).inHours;
    var minuteDifference = now.difference(dateTime).inMinutes;

    if (daysDifference > 365) {
      return (daysDifference % 365).toString() + ' Year Ago';
    } else if (monthDifference > 0) {
      return monthDifference.toString() + ' Month Ago';
    } else if (daysDifference > 1){
      return daysDifference.toString() + ' Days Ago';
    } else if (hourDifference > 1){
      return hourDifference.toString() + ' Hours Ago';
    } else if (minuteDifference > 0){
      return minuteDifference.toString() + ' Minutes Ago';
    }

    return globalDateFormat.format(dateTime);

  }

}