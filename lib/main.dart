// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:nutricion_app/providers/auth_provider.dart';
import 'package:nutricion_app/providers/sidemenu_provider.dart';
import 'package:nutricion_app/router/router.dart';
import 'package:nutricion_app/services/local_storage.dart';
import 'package:nutricion_app/services/navigation_service.dart';
import 'package:nutricion_app/ui/layouts/auth/auth_layout.dart';
import 'package:nutricion_app/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:nutricion_app/ui/layouts/splash/spash_layout.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocalStorage.configurePrefs();
  Flutorouter.configureRoutes();

  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nutrici',
      initialRoute: '/',
      onGenerateRoute: Flutorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      builder: (_, child) {
        // LocalStorage.prefs.getString('token');
        final authprovider = Provider.of<AuthProvider>(context);

        if (authprovider.authStatus == AuthStatus.checking) {
          return SplashLayout();
        }

        if (authprovider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.green[600]),
        ),
      ),
    );
  }
}
