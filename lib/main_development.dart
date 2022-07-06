import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supplier_drivers/app.dart';
import 'package:supplier_drivers/domain/config/base_url_config.dart';
import 'package:supplier_drivers/domain/config/flavor_config.dart';
import 'package:supplier_drivers/domain/di/provider_bloc.dart';
import 'package:supplier_drivers/injection_container.dart' as di;
import 'package:supplier_drivers/widget/bloc/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');

  FlavorConfig(
    flavor: Flavor.DEVELOPMENT,
    values: FlavorValues(baseUrl: BaseUrlConfig().baseUrlDevelopment),
  );
  await di.init();
  BlocOverrides.runZoned(
        () => runApp(MultiBlocProvider(
        providers: providers,
        child: const App())),
    blocObserver: CubitObserver(),
  );
}