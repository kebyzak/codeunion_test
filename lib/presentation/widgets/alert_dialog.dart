  import 'package:flutter/cupertino.dart';

  class CustomAlertDialog extends StatelessWidget {
    final String title;
    final VoidCallback? onActionPressed;

    const CustomAlertDialog({super.key,
      required this.title,
      this.onActionPressed,
    });

    @override
    Widget build(BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Manrope',
          ),
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.of(context).pop();
              if (onActionPressed != null) {
                onActionPressed!();
              }
            },
            child: const Text(
              "OK",
              style: TextStyle(
                fontFamily: 'Manrope',
              ),
            ),
          ),
        ],
      );
    }
  }
