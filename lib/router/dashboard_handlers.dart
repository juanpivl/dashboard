import 'package:fluro/fluro.dart';
import 'package:nutricion_app/providers/auth_provider.dart';
import 'package:nutricion_app/providers/sidemenu_provider.dart';
import 'package:nutricion_app/router/router.dart';
import 'package:nutricion_app/ui/views/blank_view.dart';
import 'package:nutricion_app/ui/views/dashboard_view.dart';
import 'package:nutricion_app/ui/views/icons_view.dart';
import 'package:nutricion_app/ui/views/login_view.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flutorouter.dashboarRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return DashboardView();
    } else {
      return LoginView();
    }
  });

  static Handler icons = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flutorouter.iconsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return IconsView();
    } else {
      return LoginView();
    }
  });

  static Handler blank = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flutorouter.blankRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return BlankView();
    } else {
      return LoginView();
    }
  });
}
