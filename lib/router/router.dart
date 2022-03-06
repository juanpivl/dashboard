import 'package:fluro/fluro.dart';
import 'package:nutricion_app/router/admin_handlers.dart';
import 'package:nutricion_app/router/dashboard_handlers.dart';
import 'package:nutricion_app/router/no_page_found_handlers.dart';

class Flutorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  //Auth Router
  static String loginRoute = '/auht/login';
  static String registerRoute = '/auth/register';

  //dashboard
  static String dashboarRoute = '/dasboard';

  static void configureRoutes() {
    //Auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    //dashboard
    router.define(dashboarRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
