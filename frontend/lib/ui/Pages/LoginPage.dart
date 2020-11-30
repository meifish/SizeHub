import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/Auth/GroupedAuthWidgets.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key, this.isRegister}) : super(key: key);
  bool isRegister;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GroupedAuthWidgets(isRegister: isRegister,),
    );
  }
}
