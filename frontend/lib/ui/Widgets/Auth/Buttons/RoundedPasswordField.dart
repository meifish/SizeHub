import 'package:flutter/material.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final Color color;
  final TextEditingController controller;

  const RoundedPasswordField(
      {Key key, this.onChanged, this.color, this.controller})
      : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _isObscure=true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _isObscure,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: widget.color,
      style: TextStyle(fontSize: 16.0, color: widget.color),
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          Icons.lock_outlined,
          color: widget.color,
          size: 22.0,
        ),
        suffixIcon:IconButton(
          icon: Icon(
            _isObscure? Icons.visibility_off: Icons.visibility,
            color: widget.color,
            size: 22.0,
          ),
          onPressed: (()=>setState(()=>_isObscure=!_isObscure)),
        ),
        hintText: 'Your Password',
        hintStyle: TextStyle(color: widget.color, fontSize: 17.0),
      ),
    );
  }
}
