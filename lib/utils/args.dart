import 'package:meta/meta.dart';

List<T> splitAndConvert<T>(
  String args, {
  @required String pattern,
  @required T Function(String a) to,
}) {
  return args.split(pattern).map(to).toList();
}

List<T> splitOnBlankAndConvert<T>(
  String args, {
  @required T Function(String a) to,
}) {
  return args.split('\n').map(to).toList();
}

List<T> splitOnDoubleBlankAndConvert<T>(
  String args, {
  @required T Function(String a) to,
}) {
  return args.split('\n\n').map(to).toList();
}
