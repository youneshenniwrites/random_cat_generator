import 'failures.dart';

const String SERVER_FAILURE = 'Server Failure';
const String NO_CONNECTION_FAILURE = 'No Connection Failure';
const String UNKNOWN_FAILURE = 'Unknown Failure';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE;
      break;
    case NoInternetFailure:
      return NO_CONNECTION_FAILURE;
      break;
    default:
      return UNKNOWN_FAILURE;
  }
}
