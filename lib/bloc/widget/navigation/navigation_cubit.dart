import 'package:bloc/bloc.dart';
import 'package:supplier_drivers/bloc/widget/navigation/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  static const _home = NavigationState(NavbarItem.home, 0);
  static const _orders = NavigationState(NavbarItem.orders, 1);
  static const _routes = NavigationState(NavbarItem.routes, 2);
  static const _profile = NavigationState(NavbarItem.profile, 3);

  NavigationCubit({NavigationState? navigationState})
      : super(navigationState ?? _home);

  void setNavigationClickEvent({NavbarItem? navbarItem, int index = -1}) {
    print("index: $index");
    if (navbarItem != null) {
      switch (navbarItem) {
        case NavbarItem.home:
          emit(_home);
          break;
        case NavbarItem.orders:
          emit(_orders);
          break;
        case NavbarItem.routes:
          emit(_routes);
          break;
        case NavbarItem.profile:
          emit(_profile);
          break;
      }
    } else if (index >= 0) {
      switch (index) {
        case 0:
          emit(_home);
          break;
        case 1:
          emit(_orders);
          break;
        case 2:
          emit(_routes);
          break;
        case 3:
          emit(_profile);
          break;
      }
    }
  }
}
