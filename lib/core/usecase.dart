import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_feathersjs_demo_app/core/failures.dart';
import 'package:flutter_feathersjs_demo_app/core/util.dart';

abstract class UseCase<Type, Params> {
  Utils utils;
  UseCase(this.utils);
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
