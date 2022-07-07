import 'package:equatable/equatable.dart';

enum NavbarItem { home, orders, routes, profile }

class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  const NavigationState(this.navbarItem, this.index);

  @override
  List<Object?> get props => [navbarItem, index];
}
