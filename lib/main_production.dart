import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supplier_drivers/app.dart';
import 'package:supplier_drivers/bloc/pages/bloc_observer.dart';
import 'package:supplier_drivers/bloc/pages/splash/splash_cubit.dart';
import 'package:supplier_drivers/bloc/widget/navigation/navigation_cubit.dart';
import 'package:supplier_drivers/domain/config/base_url_config.dart';
import 'package:supplier_drivers/domain/config/flavor_config.dart';
import 'package:supplier_drivers/domain/di/provider_bloc.dart';
import 'package:supplier_drivers/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  FlavorConfig(
    flavor: Flavor.PRODUCTION,
    values: FlavorValues(baseUrl: BaseUrlConfig().baseUrlProduction),
  );
  await di.init();
  BlocOverrides.runZoned(
        () => runApp(MultiBlocProvider(
        providers: DriverBlocProvider.providers,
        child: const App())),
    blocObserver: CubitObserver(),
  );
}