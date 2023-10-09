import 'package:auto_route/auto_route.dart';
import 'package:codeunion_test/presentation/routes/router.dart';
import 'package:codeunion_test/presentation/widgets/auth_button.dart';
import 'package:codeunion_test/presentation/widgets/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Авторизация', style: kAppBarTextStyle),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: const Column(
                children: [
                  CupertinoTextField.borderless(
                    placeholder: 'Логин или почта',
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xFFE0E6ED),
                  ),
                  CupertinoTextField.borderless(
                    placeholder: 'Пароль',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            AuthButton(
              text: 'Войти',
              onPressed: () {
                AutoRouter.of(context).replace(const ProfileRoute());
              },
            ),
            const SizedBox(height: 19),
            AuthButton(
              text: 'Зарегистрироваться',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
