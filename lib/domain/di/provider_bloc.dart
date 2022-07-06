import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplier_drivers/widget/bloc/splash/splash_cubit.dart';

var providers = [BlocProvider(create: (_) => SplashCubit())];
