import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/error/messages.dart';
import '../../domain/entities/random_cat.dart';
import '../../domain/usecases/get_random_cat.dart';

part 'random_cat_event.dart';
part 'random_cat_state.dart';

class RandomCatBloc extends Bloc<RandomCatEvent, RandomCatState> {
  final GetRandomCat getRandomCat;

  RandomCatBloc({
    @required GetRandomCat cat,
  })  : assert(cat != null),
        getRandomCat = cat;

  @override
  RandomCatState get initialState => Empty();

  @override
  Stream<RandomCatState> mapEventToState(_) async* {
    yield Loading();
    final failureOrCat = await getRandomCat();
    yield failureOrCat.fold(
      (failure) => Error(message: mapFailureToMessage(failure)),
      (randomCat) => Loaded(randomCat: randomCat),
    );
  }
}
