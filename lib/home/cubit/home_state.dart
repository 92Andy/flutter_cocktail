part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class LoadingHomeState extends HomeState {}

class LoadedHomeState extends HomeState {}

class ErrorHomeState extends HomeState {
  ErrorHomeState({
    required this.message,
  });
  final String message;
}

class NoInternetConnectionHomeState extends ErrorHomeState {
  NoInternetConnectionHomeState() : super(message: 'No internet connection!');
}
