import 'package:dam_ai/features/home/cubit/article_cubit.dart';
import 'package:dam_ai/features/home/widgets/subject_filtering_view.dart';
import 'package:dam_ai/core/utilis/app_theme/app_themes.dart';
import 'package:dam_ai/features/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/presentaion/scrrens/home_screen.dart';

class DamAiApp extends StatefulWidget {
  const DamAiApp({super.key});

  @override
  State<DamAiApp> createState() => _DamAiAppState();
}

class _DamAiAppState extends State<DamAiApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        routes: {
          HomeScreen.route: (context) => const HomeScreen(),
          OnBoardingScreen.route: (context) => const OnBoardingScreen(),
        },
        initialRoute: OnBoardingScreen.route,
        builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: child ?? const HomeScreen(),
        ),
      ),
    );
  }
}
