import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplier_drivers/bloc/pages/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({SplashState? initialState})
      : super(initialState ?? InitialSplash());

  int index = 0;

  void getData() async {
    emit(LoadingSplash());
    index++;
    print("loading start");
    await Future.delayed(const Duration(seconds: 2), () {});
    print("loaded");
    emit(const LoadedSplash());
    index++;
    await Future.delayed(const Duration(seconds: 2), () {});
    emit(const FailureSplash(errorMessage: "Error"));
    index++;
    print("failure");
  }
}
