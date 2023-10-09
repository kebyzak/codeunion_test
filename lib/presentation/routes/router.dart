import 'package:auto_route/auto_route.dart';

import '../screens/auth_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/feed_screen.dart';
import '../screens/map_screen.dart';
import '../screens/profile_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page, path: '/login', initial: true),
        AutoRoute(page: FeedRoute.page, path: '/feed'),
        AutoRoute(page: MapRoute.page, path: '/map'),
        AutoRoute(page: FavoritesRoute.page, path: '/favorites'),
        AutoRoute(page: ProfileRoute.page, path: '/profile'),
      ];
}
