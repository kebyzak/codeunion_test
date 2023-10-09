import 'package:auto_route/auto_route.dart';
import 'package:codeunion_test/data/repository/user_repository.dart';
import 'package:codeunion_test/presentation/routes/router.dart';
import 'package:codeunion_test/presentation/widgets/auth_button.dart';
import 'package:codeunion_test/presentation/widgets/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/alert_dialog.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final UserRepository userRepository = UserRepository();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              child: Column(
                children: [
                  CupertinoTextField.borderless(
                    controller: emailController,
                    placeholder: 'Логин или почта',
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color(0xFFE0E6ED),
                  ),
                  CupertinoTextField.borderless(
                    controller: passwordController,
                    obscureText: true,
                    placeholder: 'Пароль',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            AuthButton(
              text: 'Войти',
              onPressed: () async {
                final email = emailController.text;
                final password = passwordController.text;
                final credentials =
                    await userRepository.signIn(email, password);

                if (credentials != null) {
                  AutoRouter.of(context).replace(const ProfileRoute());
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => const CustomAlertDialog(
                      title: 'Ошибка',
                    ),
                  );
                }
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
