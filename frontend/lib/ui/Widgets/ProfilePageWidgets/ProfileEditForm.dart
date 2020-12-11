import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:size_hub/data/temp/profileModel.dart';
import 'package:size_hub/model/AuthenticationService.dart';
import 'package:size_hub/ui/Pages/SplashPage.dart';
import 'package:size_hub/ui/Widgets/Common/PurpleRaisedButton.dart';
import 'package:size_hub/ui/Widgets/DialogueWidget/BodyShapeDialog.dart';
import 'package:size_hub/model/notification_helper.dart';
import 'package:size_hub/model/profileDB_helper.dart';
import 'package:provider/provider.dart';

class ProfileEditForm extends StatefulWidget {
  // existingProfile;
  Profile user;
  String heightFeet;
  String heightInch;
  String weightPound;

  // This is a json map structure as listed in 'assets/data/FakeProfileData.json
  ProfileEditForm.fromMap(Map<String, dynamic> map) {
    user = Profile(
      usrID: map["usrID"],
      usrName: map["usrName"],
      gender: map["gender"],
      imgURL: map["imgURL"],
      introduction: map["introduction"],
      height: map["height"],
      weight: map["weight"],
      bodyShape: map["bodyShape"],
    );
    heightFeet = user.digitFeetAndInch[0];
    heightInch = user.digitFeetAndInch[1];
    weightPound = user.digitPound;
  }

  @override
  _ProfileEditFormState createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  ///////////////// DB Initiation //////////////////////////////////////////////
  final _db = profileDBModel();

  ////////// Notifications Channel Setup ///////////////////////////////////////
  final _notifications = Notifications(
      channelId: "profileNotification",
      channelName: "Profile Notification",
      channelDescription: "Profile Notification");
  final notificationPayLoad = "Profile";

  ////////// Form Data /////////////////////////////////////////////////////////
  final _formKey = GlobalKey<FormState>();

  // Gender Switch button
  List<bool> _genderSelections = List.generate(3, (_) => false);

  // Body Type Drop Down
  List<String> _bodyType = [
    'Hourglass',
    'Triangle',
    'Reversed Triangle',
    'Oval',
    'Rectangle'
  ];
  String dropdownValue = 'Hourglass';

  //////////////////////////////////////////////////////////////////////////////
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _notifications.init();

    return SafeArea(
      top: true,
      bottom: true,
      child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            children: [
              //////////////////// Photo /////////////////////////////////
              Row(children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(widget.user.imgURL),
                            fit: BoxFit.cover)),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //////////////// Change Photo ////////////////////////
                    Container(
                        height: 35,
                        child: PurpleRaisedButton(
                            child: Text("Change Image"), onPressed: () {})),
                    SizedBox(height: 5),
                    ////////////////////// Name //////////////////////////
                    Container(
                      height: 60,
                      width: 200,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.purple),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                          ),
                          hintText: 'Enter a Display Name',
                          labelText: 'User Name',
                        ),
                        inputFormatters: [LengthLimitingTextInputFormatter(20)],
                        initialValue: widget.user.usrName,
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
                          widget.user.usrName = userName;
                        },
                      ),
                    ),
                  ],
                ),
              ]),

              ////////////////////// Intro ///////////////////////////////
              SizedBox(height: 20),
              Container(
                child: TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.purple)),
                      hintText: 'Tell everyone about yourself.',
                      labelText: 'Intro',
                      labelStyle: TextStyle(fontSize: 12, color: Colors.purple),
                      hintStyle: TextStyle(fontSize: 12)),
                  inputFormatters: [LengthLimitingTextInputFormatter(500)],
                  initialValue: widget.user.introduction,
                  onSaved: (userHeightInch) {
                    widget.heightInch = userHeightInch;
                  },
                ),
              ),
              ////////////////////// Gender //////////////////////////////
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
                        widget.user.gender = "female";
                      } else if (_genderSelections[1] == true) {
                        widget.user.gender = "male";
                      } else {
                        widget.user.gender = "other";
                      }
                      setState(() {});
                    },
                  ),
                ),
              ),

              ////////////////////// Height //////////////////////////////
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(children: [
                    //////////////////////// feet ////////////////////////
                    Container(
                      height: 40,
                      width: 80,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(70.0)),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(70.0)),
                                borderSide: BorderSide(color: Colors.purple)),
                            hintText: 'Enter feet',
                            labelText: 'feet',
                            labelStyle:
                                TextStyle(fontSize: 12, color: Colors.purple),
                            hintStyle: TextStyle(fontSize: 12)),
                        inputFormatters: [LengthLimitingTextInputFormatter(1)],
                        validator: (userHeightFeet) {
                          if (!userHeightFeet.isEmpty) {
                            if (int.parse(userHeightFeet) > 8)
                              return 'A valid feet is required';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        onSaved: (userHeightFeet) {
                          widget.heightFeet = userHeightFeet;
                        },
                      ),
                    ),

                    SizedBox(width: 10),
                    //////////////////////// inch ////////////////////////
                    Container(
                      height: 40,
                      width: 80,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(70.0)),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(70.0)),
                                borderSide: BorderSide(color: Colors.purple)),
                            hintText: 'Enter Inch',
                            labelText: 'inch',
                            labelStyle:
                                TextStyle(fontSize: 12, color: Colors.purple),
                            hintStyle: TextStyle(fontSize: 12)),
                        inputFormatters: [LengthLimitingTextInputFormatter(2)],
                        validator: (userHeightInch) {
                          if (!userHeightInch.isEmpty) {
                            if (int.parse(userHeightInch) > 12)
                              return 'A valid inch is required';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        onSaved: (userHeightInch) {
                          widget.heightInch = userHeightInch;
                        },
                      ),
                    ),
                  ])),

              /////////////////////// pound //////////////////////////////
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
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(70.0)),
                                borderSide: BorderSide(color: Colors.purple)),
                            hintText: 'Enter Pound',
                            labelText: 'pound',
                            labelStyle:
                                TextStyle(fontSize: 12, color: Colors.purple),
                            hintStyle: TextStyle(fontSize: 12)),
                        inputFormatters: [LengthLimitingTextInputFormatter(3)],
                        textInputAction: TextInputAction.next,
                        autofocus: true,
                        onSaved: (userWeightPound) {
                          widget.weightPound = userWeightPound;
                        },
                      ),
                    )
                  ],
                ),
              ),

              //////////////////////// body //////////////////////////////
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
                                items: _bodyType.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        style: TextStyle(fontSize: 14)),
                                  );
                                }).toList(),
                                onChanged: (String value) {
                                  setState(() {
                                    widget.user.bodyShape = value;
                                  });
                                })),
                      )),

                  ////////////////// body shape dialog ///////////////////
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
              //////////////////////// Save //////////////////////////////
              PurpleRaisedButton(
                child: Text("Save"),
                onPressed: submit,
              ),
              PurpleRaisedButton(
                child: Text('Sign Out'),
                onPressed: () {
                  context
                      .read<AuthenticationService>()
                      .signOut()
                      .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SplashPage()),
                          ));
                },
              )
            ],
          )),
    );
  }

  void submit() async {
    if (_formKey.currentState.validate()) {
      // Show Snackbar
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('profile updated.'),
      ));

      _formKey.currentState.save();
      if ((int.tryParse(widget.heightFeet) != null) &&
          (int.tryParse(widget.heightInch) != null)) {
        widget.user.Height = {
          "feet": widget.heightFeet,
          "inch": widget.heightInch,
        };
      }
      if (int.tryParse(widget.weightPound) != null) {
        widget.user.Weight = widget.weightPound;
      }
    }
    print("Save profile");
    _updateProfile();
    _sendSuccesfulNotification();

    Navigator.pop(context, "Profile updated.");
  }

  void _updateProfile() async {
    int response = await _db.updateProfile(widget.user);
    print("update successful");
    print(response);
  }

  void _sendSuccesfulNotification() {
    _notifications.sendNotificationNow("SizeHub",
        "thank you for setting up your profile!", notificationPayLoad);
  }
}
