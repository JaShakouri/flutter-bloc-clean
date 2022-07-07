import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supplier_drivers/bloc/widget/navigation/navigation_cubit.dart';
import 'package:supplier_drivers/bloc/widget/navigation/navigation_state.dart';
import 'package:supplier_drivers/domain/theme/colorThemes.dart';

class NavigationView extends StatefulWidget {
  final NavigationCubit navigationCubit;

  const NavigationView({Key? key, required this.navigationCubit})
      : super(key: key);

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
        bloc: widget.navigationCubit,
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            elevation: 0.0,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ColorTheme.primaryDarkColor,
            unselectedItemColor: ColorTheme.primaryLightColor,
            backgroundColor: ColorTheme.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.document_scanner_rounded,
                ),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.route_rounded,
                ),
                label: 'Routes',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                ),
                label: 'Menu',
              ),
            ],
            onTap: (index) =>
                widget.navigationCubit.setNavigationClickEvent(index: index),
          );
        });
  }
}
