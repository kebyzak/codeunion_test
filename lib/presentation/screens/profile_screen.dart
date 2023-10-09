import 'package:auto_route/auto_route.dart';
import 'package:codeunion_test/presentation/routes/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_bloc.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/const.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    userBloc.add(const UserEvent.fetchUserData());

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFF3F4F6),
          appBar: const CupertinoNavigationBar(
            middle: Text('Профиль', style: kAppBarTextStyle),
          ),
          body: SafeArea(
            child: Center(
              child: state.when(
                initial: () => const Text('initial'),
                loading: () => const Text('loading'),
                success: (user) => Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 64,
                      child: Image.asset("assets/icons/profile.png"),
                    ),
                    const SizedBox(height: 15),
                    Text(user.nickname ?? '', style: kProfileNameTextStyle),
                    const SizedBox(height: 12),
                    Text(user.email ?? '', style: kProfileEmailTextStyle),
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
                        child:
                            const Text('Выйти', style: kProfileLogOutTextStyle),
                        onTap: () {
                          userBloc.add(const UserEvent.logout());
                        },
                      ),
                    ),
                  ],
                ),
                error: () => const Text('error'),
                loggedOut: () {
                  userBloc.email = null;
                  userBloc.password = null;
                  AutoRouter.of(context).replace(const AuthRoute());
                  return null;
                },
              ),
            ),
          ),
          bottomNavigationBar: const BottomNavbar(),
        );
      },
    );
  }
}
