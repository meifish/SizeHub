class Profile {
  String usrID;
  String usrName;
  String gender;
  String imgURL;
  String introduction;
  String totalPost;
  String height;
  String weight;
  String bodyShape;

  Profile({
    this.usrID,
    this.usrName,
    this.gender,
    this.imgURL,
    this.introduction,
    this.totalPost,
    this.height,
    this.weight,
    this.bodyShape,
  });

  // Helper functions: Height/ Weight unit conversion
  String feetInchToCm(String feetInch) {
    String cm;

    // feet inch expression: 5'7"
    if (feetInch.substring(feetInch.length - 1) == "\"") {
      feetInch = feetInch.substring(0, feetInch.length - 1);
    }

    List<String> temp = feetInch.split("\'");
    int feet = int.parse(temp[0]);
    int inch = int.parse(temp[1]);
    cm = ((12 * feet + inch) * 2.54).toString() + " cm";

    return cm;
  }

  String lbToKg(String lb) {
    String kg;

    if (lb.endsWith("lb")) {
      lb = lb.substring(0, lb.length - 3);
    }

    kg = (double.parse(lb) * 0.453592).toString() + " kg";

    return kg;
  }
}
