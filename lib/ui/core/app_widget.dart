import 'package:classroom/core/services/navigation_service.dart';
import 'package:classroom/injection.dart';
import 'package:classroom/states/auth/auth_bloc.dart';
import 'package:classroom/states/course/course_bloc.dart';
import 'package:classroom/ui/auth/pages/auth_checker_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final NavigationService _navigationService = getIt<NavigationService>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthBloc>(),
        ),
        BlocProvider(
          create: (_) => getIt<CourseBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        key: _navigationService.navigationKey,
        theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.montserratTextTheme(),
          appBarTheme: const AppBarTheme(color: Colors.black),
          splashFactory: InkRipple.splashFactory,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: ZoomPageTransitionsBuilder(),
            },
          ),
        ),
        home: const AuthCheckPage(),
      ),
    );
  }
}
