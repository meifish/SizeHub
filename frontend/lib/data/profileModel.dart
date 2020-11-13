class Profile {
  int usrID;
  String usrName;
  String gender;
  String imgURL;
  String introduction;
  String height;
  String weight;
  String bodyShape;

  Profile({
    this.usrID,
    this.usrName,
    this.gender,
    this.imgURL,
    this.introduction,
    this.height,
    this.weight,
    this.bodyShape,
  });

  Profile.fromMap(Map<String, dynamic> map) {
    this.usrID = map["usrID"];
    this.usrName = map["usrName"];
    this.gender = map["gender"];
    this.introduction = map["introduction"];
    this.height = map["height"];
    this.weight = map["weight"];
    this.bodyShape = map["bodyShape"];
  }

  Map<String, dynamic> toMap() {
    return {
      'usrID': usrID,
      'usrName': usrName,
      'gender': gender,
      'introduction': introduction,
      'height': height,
      'weight': weight,
      'bodyShape': bodyShape
    };
  }

  String toString() {
    return 'Profile{id: $usrID, usrName: $usrName, gender: $gender, introduction: $introduction, height: $height, weight: $weight, bodyShape: $bodyShape}';
  }

  void set Height(var h) {
    this.height = h["feet"] + "\'" + h["inch"] + "\"";
  }

  void set Weight(String pound) {
    this.weight = pound + " lb";
  }

  List<String> get digitFeetAndInch {
    return breakFeetInch(this.height);
  }

  String get digitPound {
    return removePoundSymbol(this.weight);
  }

  List<String> breakFeetInch(String feetInch) {
    // feet inch expression: 5'7"
    if (feetInch.substring(feetInch.length - 1) == "\"") {
      feetInch = feetInch.substring(0, feetInch.length - 1);
    }

    List<String> feet_inch = feetInch.split("\'");
    return feet_inch;
  }

  // Helper functions: Height/ Weight unit conversion
  String feetInchToCm(String feetInch) {
    String cm;

    List<String> temp = breakFeetInch(feetInch);
    int feet = int.parse(temp[0]);
    int inch = int.parse(temp[1]);
    cm = ((12 * feet + inch) * 2.54).toString() + " cm";

    return cm;
  }

  String removePoundSymbol(String lb) {
    if (lb.endsWith("lb")) {
      lb = lb.substring(0, lb.length - 3);
    }
    return lb;
  }

  String lbToKg(String lb) {
    String kg;

    lb = removePoundSymbol(lb);
    kg = (double.parse(lb) * 0.453592).toString() + " kg";

    return kg;
  }
}
