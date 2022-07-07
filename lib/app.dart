import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:supplier_drivers/domain/routes/pages.dart';
import 'package:supplier_drivers/domain/theme/materialAppTheme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drivers App',
      theme: AppTheme.lightTheme,
      initialRoute: Pages.init,
      routes: Pages.routes,
    );
  }
}
