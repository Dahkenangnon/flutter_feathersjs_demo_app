import 'package:equatable/equatable.dart';

///
// ignore: must_be_immutable
class User extends Equatable {
  String id;
  String email;
  DateTime createdAt;
  DateTime updatedAt;

  User({this.id, this.email, this.createdAt, this.updatedAt});

  /// This is useful to deserialize this dart class
  /// As we cannot use the factory method
  static User fromMap(Map<String, dynamic> json) {
    return User.fromJson(json);
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      updatedAt: DateTime.parse(json["updatedAt"]),
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  List<Object> get props => [
        id,
        email,
        createdAt,
        updatedAt,
      ];
}
