import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/random_cat.dart';

abstract class RandomCatContract {
  Future<Either<Failure, RandomCat>> getRandomCat();
}
