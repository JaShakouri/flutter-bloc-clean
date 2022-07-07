import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class InitialSplash extends SplashState {}

class LoadingSplash extends SplashState {}

class LoadedSplash extends SplashState {
  const LoadedSplash();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'Loaded{listArticles}';
  }
}

class FailureSplash extends SplashState {
  final String errorMessage;

  const FailureSplash({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'Failure{errorMessage: $errorMessage}';
  }
}
