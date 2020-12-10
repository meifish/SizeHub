import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:size_hub/ui/Widgets/Auth/Buttons/RoundedInputField.dart';

class CreatePostForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RoundedInputField(
            icon: Icons.checkroom,
            hintText: 'Clothing name',
            color: Colors.purple,
          ),
          RoundedInputField(
            icon: Icons.business,
            hintText: 'Brand',
            color: Colors.purple,
          ),
          RoundedInputField(
            icon: Icons.text_fields,
            hintText: 'Caption',
            color: Colors.purple,
          ),
          RoundedInputField(
              color: Colors.purple,
              icon: FontAwesomeIcons.tshirt,
              hintText: 'Clothing size'),
          Row(
            children: [
              Flexible(
                  child: RoundedInputField(
                color: Colors.purple,
                icon: FontAwesomeIcons.rulerHorizontal,
                hintText: 'Weight',
              )),
              Flexible(
                  child: RoundedInputField(
                      color: Colors.purple,
                      icon: FontAwesomeIcons.rulerVertical,
                      hintText: 'Height'))
            ],
          )
        ],
      ),
    );
  }
}
