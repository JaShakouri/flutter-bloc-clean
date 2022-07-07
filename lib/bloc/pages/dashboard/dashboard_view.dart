import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplier_drivers/bloc/widget/appbar/appBar_view.dart';
import 'package:supplier_drivers/bloc/widget/navigation/navigation_cubit.dart';
import 'package:supplier_drivers/bloc/widget/navigation/navigation_view.dart';
import 'package:supplier_drivers/bloc/widget/root/body_screen.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late NavigationCubit navigationCubit;

  @override
  void initState() {
    super.initState();
    navigationCubit = BlocProvider.of<NavigationCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DriverAppBar(title: 'Driver App'),
      bottomNavigationBar: NavigationView(navigationCubit: navigationCubit),
      body: BodyScreen(navigationCubit: navigationCubit),
    );
  }
}
