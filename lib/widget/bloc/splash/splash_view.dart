import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_drivers/domain/theme/colorThemes.dart';
import 'package:supplier_drivers/domain/theme/responsiveFonts.dart';
import 'package:supplier_drivers/widget/bloc/splash/splash_cubit.dart';
import 'package:supplier_drivers/widget/bloc/splash/splash_state.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late SplashCubit _splashCubit;

  @override
  void initState() {
    super.initState();
    _splashCubit = BlocProvider.of<SplashCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: ColorTheme.white,
      body: BlocBuilder<SplashCubit, SplashState>(
        bloc: _splashCubit,
        builder: (context, state) {

          print("state: $state");

          switch (state.runtimeType) {
            case LoadingSplash:
              return SafeArea(
                child: GestureDetector(
                  onTap: () {
                    _splashCubit.getData();
                  },
                  child: Center(
                    child: Text(
                      "${_splashCubit.index}"
                      "\n"
                      "Loading",
                      textAlign: TextAlign.center,
                      style: getFontStyle(FontType.headline1,
                          color: ColorTheme.dark),
                    ),
                  ),
                ),
              );
              break;

            case LoadedSplash:
              return SafeArea(
                child: GestureDetector(
                  onTap: () {
                    _splashCubit.getData();
                  },
                  child: Center(
                    child: Text(
                      "${_splashCubit.index}"
                      "\n"
                      "Loaded",
                      textAlign: TextAlign.center,
                      style: getFontStyle(FontType.headline1,
                          color: ColorTheme.dark),
                    ),
                  ),
                ),
              );
              break;

            case FailureSplash:
              return SafeArea(
                child: GestureDetector(
                  onTap: () {
                    _splashCubit.getData();
                  },
                  child: Center(
                    child: Text(
                      "${_splashCubit.index}"
                      "\n"
                      "Failure",
                      textAlign: TextAlign.center,
                      style: getFontStyle(FontType.headline1,
                          color: ColorTheme.primaryDarkColor),
                    ),
                  ),
                ),
              );
              break;

            default:
              return SafeArea(
                child: GestureDetector(
                  onTap: () {
                    _splashCubit.getData();
                  },
                  child: Center(
                    child: Text(
                      "${_splashCubit.index}"
                      "\n"
                      "Bloc Testing"
                      "\n"
                      "Click on me",
                      textAlign: TextAlign.center,
                      style: getFontStyle(FontType.headline1,
                          color: ColorTheme.dark),
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _splashCubit.close();
    super.dispose();
  }
}
