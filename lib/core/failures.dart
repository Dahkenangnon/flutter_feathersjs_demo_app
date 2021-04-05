import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String msg;
  Failure({this.msg});
  String get message => this.msg;
  @override
  List<Object> get props => [msg];
}
