import 'package:dam_ai/features/home/widgets/subject_filtering_view.dart';
import 'package:dam_ai/core/utilis/app_theme/app_themes.dart';
import 'package:flutter/material.dart';

import 'features/home/presentaion/home_screen.dart';

class DamAiApp extends StatefulWidget {
  const DamAiApp({super.key});

  @override
  State<DamAiApp> createState() => _DamAiAppState();
}

class _DamAiAppState extends State<DamAiApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      routes: {
        HomeScreen.route: (context) => const HomeScreen(),
        SubjectFilteringView.route: (context) => const SubjectFilteringView(),
      },
      initialRoute: HomeScreen.route,
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child ?? const HomeScreen(),
      ),
    );
  }
}
