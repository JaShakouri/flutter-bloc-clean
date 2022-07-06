import 'dart:developer' as logger;

import 'package:bloc/bloc.dart';

class CubitObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    logger.log('${bloc.runtimeType} $change');

    super.onChange(bloc, change);
  }
}
