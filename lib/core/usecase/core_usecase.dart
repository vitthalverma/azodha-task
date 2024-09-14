import 'package:azodha_task/core/network/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class CoreUsecases<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params input);
}

class NoParams {}
