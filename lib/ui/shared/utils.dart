import 'package:timeago/timeago.dart' as timeago;

class SharedMethods {
  String updatedAt(dynamic job) {
    timeago.setLocaleMessages('tr', timeago.TrMessages());
    return timeago.format(DateTime.parse(job.updatedAt), locale: 'tr');
  }
}
