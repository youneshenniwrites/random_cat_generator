part of 'random_cat_bloc.dart';

@immutable
abstract class RandomCatState {}

// * The four states of UI

class Empty extends RandomCatState {}

class Loading extends RandomCatState {}

class Loaded extends RandomCatState {
  final RandomCat randomCat;

  Loaded({@required this.randomCat});
}

class Error extends RandomCatState {
  final String message;

  Error({@required this.message});
}
