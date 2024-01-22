// ignore_for_file: file_names

import 'package:talky_chat/services/interfaces/LogService.dart';

class LogServiceImpl extends LogService {
  LogServiceImpl._();
  static final LogServiceImpl instance = LogServiceImpl._();
  @override
  // ignore: avoid_print
  void log(String message) => print(message);
}
