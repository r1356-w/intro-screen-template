import 'package:flutter/material.dart';

void showErrorSnakBar(
  String message,
  BuildContext context, {
  required void Function() onPressed,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'lb15',
        onPressed: onPressed,
        textColor: Colors.white,
      ),
    ),
  );
}
