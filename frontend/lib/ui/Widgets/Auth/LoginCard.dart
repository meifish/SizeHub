import 'package:flutter/material.dart';
import 'package:size_hub/ui/Widgets/Auth/Buttons/SocialIcon.dart';

import 'Buttons/RoundedButton.dart';
import 'Buttons/RoundedInputField.dart';
import 'Buttons/RoundedPasswordField.dart';

class LoginCard extends StatelessWidget {
  final bool isRegister;
  final VoidCallback registerOnPressed;
  final VoidCallback loginOnPressed;

  LoginCard(
      {Key key, this.registerOnPressed, this.loginOnPressed, this.isRegister})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        RoundedInputField(
          hintText: "Your Email",
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          onChanged: (value) {},
        ),
        RoundedButton(
          text: isRegister ? "Sign Up" : "Login",
          onPressed: loginOnPressed,
        ),
        RoundedButton(
          text: "Register",
          onPressed: registerOnPressed,
        ),
        Divider(),
        isRegister
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialIcon(
                    url:
                        "https://cdn.freebiesupply.com/logos/large/2x/facebook-logo-2019.png",
                    onPressed: () {},
                  ),
                  SocialIcon(
                    url:
                        "https://i.pinimg.com/originals/39/21/6d/39216d73519bca962bd4a01f3e8f4a4b.png",
                    onPressed: () {},
                  ),
                  SocialIcon(
                    url:
                        "https://lh3.googleusercontent.com/proxy/uBs4XldEizToQGmgidLJbzDnLO3u0qas8rLULMuo-hW54ptR6csFO4D-wRaBZme4UIUVinvxol1f74ObbWa6KeAM7ryETCY",
                    onPressed: () {},
                  ),
                ],
              )
            : Container()
      ],
    );
  }
}
