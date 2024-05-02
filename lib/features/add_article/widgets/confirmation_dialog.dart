import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String? message;
  final String? title;
  const ConfirmationDialog({
    super.key,
    this.message,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Container(
              width: double.infinity,
              height: 51,
              // color: ColorsManager.primaryColor,
              alignment: Alignment.center,
              child: Text(
                title!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(20 * 2),
            child: Column(
              children: [
                if (message != null) ...[
                  Text(
                    message!,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop(true);
                      },
                      style: TextButton.styleFrom(
                        // backgroundColor: ColorsManager.primaryColor,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(100, 40),
                      ),
                      child: const Text("تأكيد"),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop(false);
                      },
                      style: OutlinedButton.styleFrom(
                        // foregroundColor: ColorsManager.primaryColor,
                        side: const BorderSide(
                            // color: ColorsManager.primaryColor,
                            ),
                        minimumSize: const Size(100, 40),
                      ),
                      child: const Text("الغاء"),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
