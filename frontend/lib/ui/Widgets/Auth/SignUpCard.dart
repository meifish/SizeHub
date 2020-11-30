import 'package:flutter/material.dart';
import 'package:size_hub/ui/animations/BounceInAnimation.dart';

import 'Buttons/RoundedInputField.dart';
import 'Buttons/RoundedPasswordField.dart';

class SignUpCard extends StatelessWidget {
  final Function onChangedEmail;
  final Function onChangedPassword;

  SignUpCard({Key key, this.onChangedEmail, this.onChangedPassword})
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
              textInputType: TextInputType.text,
              icon: Icons.person_outlined,
              hintText: "Your Email",
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
