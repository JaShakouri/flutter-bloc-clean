import 'package:dartz/dartz.dart';
import 'package:supplier_drivers/domain/core/error/failure.dart';

abstract class SplashRepository {
  Future<Either<Failure, dynamic>> getVersions();
}
