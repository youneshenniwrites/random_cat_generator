import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'core/network/network_info.dart';
import 'features/random_cat/data/implementations/random_cat_implementation.dart';
import 'features/random_cat/data/providers/random_cat_provider.dart';
import 'features/random_cat/domain/contracts/random_cat_contract.dart';
import 'features/random_cat/domain/usecases/get_random_cat.dart';
import 'features/random_cat/presentation/bloc/random_cat_bloc.dart';

final locator = GetIt.instance;

void init() {
  // * [Presentation] Bloc
  locator.registerFactory(
    () => RandomCatBloc(cat: locator()),
  );

  // * [Domain] Use cases
  locator.registerLazySingleton(
    () => GetRandomCat(locator()),
  );

  // * [Data] Implementations
  locator.registerLazySingleton<RandomCatContract>(
    () => RandomCatImplementation(
      provider: locator(),
      networkInfo: locator(),
    ),
  );

  // * [Data] Provider
  locator.registerLazySingleton<RandomCatProvider>(
    () => CallRandomCatProvider(
      client: locator(),
    ),
  );

  // * [Core] Network info
  locator.registerLazySingleton<NetworkInfo>(
    () => CheckNetworkInfo(locator()),
  );

  // *
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => DataConnectionChecker());
}
