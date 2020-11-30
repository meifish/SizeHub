import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Color color;

  const RoundedPasswordField({Key key, this.onChanged, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      cursorColor: color,
      style: TextStyle(fontSize: 16.0, color: color),
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          Icons.lock_outlined,
          color: color,
          size: 22.0,
        ),
        hintText: 'Password',
        hintStyle: TextStyle(color: color, fontSize: 17.0),
      ),
    );
  }
}
