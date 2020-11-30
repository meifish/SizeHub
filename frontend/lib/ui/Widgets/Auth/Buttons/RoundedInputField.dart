import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Color color;
  final TextInputType textInputType;
  final TextEditingController controller;

  const RoundedInputField(
      {Key key,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.textInputType = TextInputType.text,
      this.controller,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      cursorColor: color,
      style: TextStyle(fontSize: 16.0, color: color),
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          icon,
          color: color,
          size: 22.0,
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: color, fontSize: 17.0),
      ),
    );
  }
}
