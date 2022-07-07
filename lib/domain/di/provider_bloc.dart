import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplier_drivers/bloc/pages/splash/splash_cubit.dart';
import 'package:supplier_drivers/bloc/widget/navigation/navigation_cubit.dart';

class DriverBlocProvider {
  static var providers = <BlocProvider>[
    // Manage for all of event in splash view
    BlocProvider<SplashCubit>(create: (_) => SplashCubit()),

    // Manage for all of event in navigation bar in widgets items
    BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
  ];
}
