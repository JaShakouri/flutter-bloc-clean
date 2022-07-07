import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplier_drivers/bloc/pages/home/home_view.dart';
import 'package:supplier_drivers/bloc/pages/orders/orders_view.dart';
import 'package:supplier_drivers/bloc/pages/profile/profile_view.dart';
import 'package:supplier_drivers/bloc/pages/routes/routes_view.dart';
import 'package:supplier_drivers/bloc/widget/navigation/navigation_cubit.dart';
import 'package:supplier_drivers/bloc/widget/navigation/navigation_state.dart';

class BodyScreen extends StatefulWidget {
  final NavigationCubit navigationCubit;

  const BodyScreen({Key? key, required this.navigationCubit}) : super(key: key);

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
        bloc: widget.navigationCubit,
        builder: (context, state) {
          switch (state.navbarItem) {
            case NavbarItem.home:
              return const HomeView();
            case NavbarItem.orders:
              return const OrdersView();
            case NavbarItem.routes:
              return const RoutesView();
            case NavbarItem.profile:
              return const ProfileView();
          }
        });
  }
}
