import 'package:zapx/Zap/zapx.dart';

validInput(String val, int min, int max, String type) {
  if (type == "email") {
    if (Zap.isValidEmail(val) == false) {
      return "not valid email";
    }
  }

  if (type == "phone") {
    if (Zap.isValidPhoneNumber(val)) {
      return "not valid phone";
    }
  }

  if (val.isEmpty) {
    return "can't be Empty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
}
