import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/navigation/navigation_bloc.dart';
import '../routes/router.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  void _onTabTapped(BuildContext context, int index) {
    final navigationBloc = context.read<NavigationBloc>();
    navigationBloc.add(NavigationEvent.tabChanged(tabIndex: index));

    if (index == 0) {
      AutoRouter.of(context).replace(const FeedRoute());
    } else if (index == 1) {
      AutoRouter.of(context).replace(const MapRoute());
    } else if (index == 2) {
      AutoRouter.of(context).replace(const FavoritesRoute());
    } else if (index == 3) {
      AutoRouter.of(context).replace(const ProfileRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        int currentIndex = state is Success ? state.tabIndex : 3;

        return CupertinoTabBar(
          currentIndex: currentIndex,
          onTap: (index) => _onTabTapped(context, index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.map),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.star),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
