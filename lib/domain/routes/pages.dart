import 'package:flutter/material.dart';
import 'package:supplier_drivers/bloc/pages/dashboard/dashboard_view.dart';
import 'package:supplier_drivers/bloc/pages/splash/splash_view.dart';

import 'routes.dart';

class Pages {

  static const init = Routes.dashboard;

  static Map<String, WidgetBuilder> routes = {
    Routes.splash: (context) => const SplashView(),
    Routes.dashboard: (context) => const DashboardView(),
  };

}