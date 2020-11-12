import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:size_hub/ui/Widgets/DialogueWidget/BodyShapeDialog.dart';

class ProfileEditPage extends StatefulWidget {
  // This is a json map structure as listed in 'assets/data/FakeProfileData.json
  var existingProfile;

  ProfileEditPage({this.existingProfile});

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final GlobalKey _formKey = GlobalKey();
  List<bool> _genderSelections = List.generate(3, (_) => false);
  String usrName;
  String gender;
  String heightfeet;
  String heightInch;
  String weightPound;
  String bodyType;
  List<String> _bodyType = [
    'Hourglass',
    'Triangle',
    'Reversed Triangle',
    'Oval',
    'Rectangle'
  ];
  String dropdownValue = 'Hourglass';

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.existingProfile);
    return Scaffold(
        body: SafeArea(
            top: true,
            bottom: true,
            child: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  children: [
                    // Photo
                    Row(children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: DecorationImage(
                                  image: AssetImage(
                                      widget.existingProfile["imgURL"]),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      SizedBox(
                          height: 35,
                          child: RaisedButton(
                            child: Text("Change Image"),
                            onPressed: () {},
                          ))
                    ]),

                    SizedBox(height: 10),
                    // Name
                    TextFormField(
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.purple),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          //  when the TextFormField in unfocused
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple),
                          //  when the TextFormField in focused
                        ),
                        hintText: 'Enter a Display Name',
                        labelText: 'User Name',
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(20)],
                      initialValue: widget.existingProfile["usrName"],
                      validator: (userName) {
                        if (userName.isEmpty) {
                          return 'Name is required';
                        }
                        if (userName.length < 1) {
                          return 'Name is too short';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onSaved: (userName) {
                        this.usrName = userName;
                      },
                    ),

                    // gender
                    SizedBox(height: 2),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: SizedBox(
                        height: 35,
                        child: ToggleButtons(
                          color: Colors.purple,
                          selectedColor: Colors.white,
                          fillColor: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text("Female")),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text("Male")),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text("Other")),
                          ],
                          isSelected: _genderSelections,
                          onPressed: (int index) {
                            for (int i = 0; i < 3; i++) {
                              _genderSelections[i] = false;
                            }
                            _genderSelections[index] = true;
                            if (_genderSelections[0] == true) {
                              this.gender = "female";
                            } else if (_genderSelections[1] == true) {
                              this.gender = "male";
                            }
                            setState(() {});
                          },
                        ),
                      ),
                    ),

                    // Height
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(children: [
                          // Feet
                          Container(
                            height: 40,
                            width: 80,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(70.0)),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(70.0)),
                                      borderSide:
                                          BorderSide(color: Colors.purple)),
                                  hintText: 'Enter feet',
                                  labelText: 'feet',
                                  labelStyle: TextStyle(
                                      fontSize: 12, color: Colors.purple),
                                  hintStyle: TextStyle(fontSize: 12)),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3)
                              ],
                              validator: (userHeightFeet) {
                                if (userHeightFeet.isEmpty) {
                                  return 'Height is required';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.next,
                              autofocus: true,
                              onSaved: (userHeightFeet) {
                                this.heightfeet = userHeightFeet;
                              },
                            ),
                          ),

                          SizedBox(width: 10),
                          // Inch
                          Container(
                            height: 40,
                            width: 80,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(70.0)),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(70.0)),
                                      borderSide:
                                          BorderSide(color: Colors.purple)),
                                  hintText: 'Enter Inch',
                                  labelText: 'inch',
                                  labelStyle: TextStyle(
                                      fontSize: 12, color: Colors.purple),
                                  hintStyle: TextStyle(fontSize: 12)),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3)
                              ],
                              textInputAction: TextInputAction.next,
                              autofocus: true,
                              onSaved: (userHeightInch) {
                                this.heightInch = userHeightInch;
                              },
                            ),
                          ),
                        ])),
                    // Weight
                    SizedBox(width: 10),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 80,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(70.0)),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          const Radius.circular(70.0)),
                                      borderSide:
                                          BorderSide(color: Colors.purple)),
                                  hintText: 'Enter Pound',
                                  labelText: 'pound',
                                  labelStyle: TextStyle(
                                      fontSize: 12, color: Colors.purple),
                                  hintStyle: TextStyle(fontSize: 12)),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3)
                              ],
                              textInputAction: TextInputAction.next,
                              autofocus: true,
                              onSaved: (userWeightPound) {
                                this.weightPound = userWeightPound;
                              },
                            ),
                          )
                        ],
                      ),
                    ),

                    // Body Type
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 1),
                      child: Text("Body Type",
                          style: TextStyle(color: Colors.purple, fontSize: 10)),
                    ),
                    Row(
                      children: [
                        Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                border: Border.all(color: Colors.purple)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      isExpanded: true,
                                      value: dropdownValue,
                                      items: _bodyType
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,
                                              style: TextStyle(fontSize: 14)),
                                        );
                                      }).toList(),
                                      onChanged: (String value) {
                                        setState(() {
                                          this.bodyType = value;
                                        });
                                      })),
                            )),

                        // Body Size info
                        SizedBox(
                            height: 50,
                            child: IconButton(
                                color: Colors.purple,
                                icon: Icon(Icons.help_outline, size: 30.0),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return BodyShapeDialog();
                                      });
                                })),
                      ],
                    ),

                    SizedBox(height: 50),
                    // Save
                    RaisedButton(
                      child: Text("Save"),
                      onPressed: () {},
                    )
                  ],
                ))));
  }
}
