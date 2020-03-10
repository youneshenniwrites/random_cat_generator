import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../core/network/network_info.dart';
import '../../domain/contracts/random_cat_contract.dart';
import '../../domain/entities/random_cat.dart';
import '../providers/random_cat_provider.dart';

class RandomCatImplementation implements RandomCatContract {
  final RandomCatProvider provider;
  final NetworkInfo networkInfo;

  RandomCatImplementation({
    @required this.provider,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, RandomCat>> getRandomCat() async {
    if (await networkInfo.isConnected) {
      try {
        final randomCat = await provider.getRandomCat();
        return Right(randomCat);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NoInternetFailure());
    }
  }
}
