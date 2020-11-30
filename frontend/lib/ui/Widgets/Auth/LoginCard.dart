import 'package:flutter/material.dart';
import 'package:size_hub/ui/animations/BounceInAnimation.dart';

import 'Buttons/RoundedInputField.dart';
import 'Buttons/RoundedPasswordField.dart';

class LoginCard extends StatelessWidget {
  final Function onChangedEmail;
  final Function onChangedPassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  LoginCard(
      {Key key,
      this.onChangedEmail,
      this.onChangedPassword,
      this.emailController,
      this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        BounceInAnimation(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: RoundedInputField(
              controller: emailController,
              textInputType: TextInputType.emailAddress,
              icon: Icons.email_outlined,
              hintText: "Your Email",
              color: Colors.black,
              onChanged: onChangedEmail,
            ),
          ),
          delay: Duration(milliseconds: 0),
        ),
        SizedBox(height: 25),
        BounceInAnimation(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: RoundedPasswordField(
              controller: passwordController,
              color: Colors.black,
              onChanged: onChangedPassword,
            ),
          ),
          delay: Duration(milliseconds: 100),
        ),
      ],
    );
  }
}
