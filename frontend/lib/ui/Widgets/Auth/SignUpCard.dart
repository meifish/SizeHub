import 'package:flutter/material.dart';
import 'package:size_hub/ui/animations/BounceInAnimation.dart';

import 'Buttons/RoundedInputField.dart';
import 'Buttons/RoundedPasswordField.dart';

class SignUpCard extends StatelessWidget {
  final Function onChangedEmail;
  final Function onChangedPassword;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SignUpCard(
      {Key key,
      this.onChangedEmail,
      this.onChangedPassword,
      this.emailController,
      this.passwordController,
      this.nameController})
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
              controller: nameController,
              textInputType: TextInputType.text,
              icon: Icons.person_outlined,
              hintText: "Your Name",
              color: Colors.white,
              onChanged: onChangedEmail,
            ),
          ),
          delay: Duration(milliseconds: 0),
        ),
        SizedBox(height: 25),
        BounceInAnimation(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: RoundedInputField(
              controller: emailController,
              textInputType: TextInputType.emailAddress,
              icon: Icons.email_outlined,
              hintText: "Your Email",
              color: Colors.white,
              onChanged: onChangedEmail,
            ),
          ),
          delay: Duration(milliseconds: 100),
        ),
        SizedBox(height: 25),
        BounceInAnimation(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: RoundedPasswordField(
              controller: passwordController,
              color: Colors.white,
              onChanged: onChangedPassword,
            ),
          ),
          delay: Duration(milliseconds: 200),
        ),
      ],
    );
  }
}
