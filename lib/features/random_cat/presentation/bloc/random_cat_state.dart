part of 'random_cat_bloc.dart';

@immutable
abstract class RandomCatState {}

// * The four states of UI

class Empty implements RandomCatState {}

class Loading implements RandomCatState {}

class Loaded implements RandomCatState {
  final RandomCat randomCat;

  Loaded({@required this.randomCat});
}

class Error implements RandomCatState {
  final String message;

  Error({@required this.message});
}
