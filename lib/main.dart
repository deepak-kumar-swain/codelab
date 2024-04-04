import 'package:code_dpk/view/home.view.dart';
import 'package:code_dpk/view/login.view.dart';
import 'package:code_dpk/view/splash.view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Deepak: Codelab',
      routerConfig: _router,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          primary: Color(0xfff68326),
          secondary: Color(0xff5166dc),
          seedColor: Color(0xfff68326),
          brightness: Brightness.light,
        ),
        brightness: Brightness.light,
      ),
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
}
