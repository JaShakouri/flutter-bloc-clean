import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supplier_drivers/domain/theme/materialAppTheme.dart';
import 'package:supplier_drivers/widget/bloc/splash/splash_cubit.dart';

import 'widget/bloc/splash/splash_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drivers App',
      theme: AppTheme.lightTheme,
      home: const Splash(),
    );
  }
}
