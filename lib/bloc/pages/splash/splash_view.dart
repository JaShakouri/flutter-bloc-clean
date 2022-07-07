import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supplier_drivers/bloc/pages/dashboard/dashboard_view.dart';
import 'package:supplier_drivers/bloc/pages/splash/splash_cubit.dart';
import 'package:supplier_drivers/bloc/pages/splash/splash_state.dart';
import 'package:supplier_drivers/domain/routes/routes.dart';
import 'package:supplier_drivers/domain/theme/colorThemes.dart';
import 'package:supplier_drivers/domain/theme/responsiveFonts.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
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

            case FailureSplash:
              {

                SchedulerBinding.instance?.addPostFrameCallback((_) {

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => const DashboardView()));
                });


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
              }

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
