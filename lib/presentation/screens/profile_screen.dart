import 'package:auto_route/auto_route.dart';
import 'package:codeunion_test/presentation/routes/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';
import '../widgets/const.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        backgroundColor: const Color(0xFFF3F4F6),
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Профиль', style: kAppBarTextStyle),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 64,
                  child: Image.asset("assets/icons/profile.png"),
                ),
                const SizedBox(height: 15),
                const Text("Марипбек Чингиз", style: kProfileNameTextStyle),
                const SizedBox(height: 12),
                const Text('maripbekoff@gmail.com',
                    style: kProfileEmailTextStyle),
                const SizedBox(height: 27),
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.only(left: 29),
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    child: const Text('Выйти', style: kProfileLogOutTextStyle),
                    onTap: (){
                      AutoRouter.of(context).replace(const AuthRoute());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
