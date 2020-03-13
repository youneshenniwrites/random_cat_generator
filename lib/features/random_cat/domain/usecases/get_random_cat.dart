import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../contracts/random_cat_contract.dart';
import '../entities/random_cat.dart';

class GetRandomCat implements UseCase<RandomCat> {
  final RandomCatContract contract;

  GetRandomCat(this.contract);

  @override
  Future<Either<Failure, RandomCat>> call() async {
    return await contract.getRandomCat();
  }
}
