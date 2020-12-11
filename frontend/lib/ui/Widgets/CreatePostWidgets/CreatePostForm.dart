import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:size_hub/ui/Widgets/Auth/Buttons/RoundedInputField.dart';

class CreatePostForm extends StatelessWidget {
  final TextEditingController clothingNameController;
  final TextEditingController brandController;
  final TextEditingController captionController;
  final TextEditingController sizeController;
  final TextEditingController weightController;
  final TextEditingController heightController;

  CreatePostForm(
      {this.clothingNameController,
      this.brandController,
      this.captionController,
      this.sizeController,
      this.weightController,
      this.heightController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RoundedInputField(
            controller: clothingNameController,
            icon: Icons.checkroom,
            hintText: 'Clothing name',
            color: Colors.purple,
          ),
          RoundedInputField(
            controller: brandController,
            icon: Icons.business,
            hintText: 'Brand',
            color: Colors.purple,
          ),
          RoundedInputField(
            controller: captionController,
            icon: Icons.text_fields,
            hintText: 'Caption',
            color: Colors.purple,
          ),
          RoundedInputField(
              textInputType: TextInputType.number,
              controller: sizeController,
              color: Colors.purple,
              icon: FontAwesomeIcons.tshirt,
              hintText: 'Clothing size'),
          Row(
            children: [
              Flexible(
                  child: RoundedInputField(
                textInputType: TextInputType.number,
                controller: weightController,
                color: Colors.purple,
                icon: FontAwesomeIcons.rulerHorizontal,
                hintText: 'Weight',
              )),
              Flexible(
                  child: RoundedInputField(
                      textInputType: TextInputType.number,
                      controller: heightController,
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
