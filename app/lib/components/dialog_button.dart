import "package:flutter/material.dart";

class DialogButton extends StatelessWidget {
  final String name;
  VoidCallback onPressed;
  DialogButton({super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(name),
      color: Color.fromRGBO(255, 199, 0, 1),
    );
  }
}
