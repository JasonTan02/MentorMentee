import 'package:flutter/material.dart';

class my_floating_action_button extends StatelessWidget {
  final Function()? onPressed;

  const my_floating_action_button({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }
}
