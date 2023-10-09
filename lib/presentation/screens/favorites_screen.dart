import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../widgets/bottom_navbar.dart';
import '../widgets/const.dart';

@RoutePage()
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      backgroundColor: Color(0xFFF3F4F6),
      navigationBar: CupertinoNavigationBar(
        middle: Text('Избранные', style: kAppBarTextStyle),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("FAVORITES"),
              BottomNavbar(),
            ],
          ),
        ),
      ),
    );
  }
}
