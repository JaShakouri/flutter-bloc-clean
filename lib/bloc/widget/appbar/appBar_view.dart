import 'package:flutter/material.dart';
import 'package:supplier_drivers/domain/theme/colorThemes.dart';
import 'package:supplier_drivers/domain/theme/fontThemes.dart';
import 'package:supplier_drivers/domain/theme/responsiveFonts.dart';

class DriverAppBar extends PreferredSize {
  final String title;
  final Widget? menu;
  final bool canBack;

  DriverAppBar({Key? key, required this.title, this.menu, this.canBack = false})
      : super(
            key: key,
            child: _CustomAppBar(title: title, menu: menu, canBack: canBack),
            preferredSize: const Size.fromHeight(kToolbarHeight));
}

class _CustomAppBar extends StatelessWidget {
  final String title;
  final Widget? menu;
  final bool canBack;

  const _CustomAppBar({required this.title, this.menu, this.canBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: ColorTheme.white,
      centerTitle: true,
      title: Text(
        title,
        style:
            getFontStyle(FontType.subtitle2, color: ColorTheme.primaryDarkColor)
                .merge(bold),
      ),
      leadingWidth: canBack ? 50.0 : 0.0,
      leading: canBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back,
                  color: ColorTheme.primaryDarkColor),
              onPressed: () {},
            )
          : const SizedBox.shrink(),
    );
  }
}
