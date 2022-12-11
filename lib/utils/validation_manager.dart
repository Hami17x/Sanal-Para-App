import 'package:email_validator/email_validator.dart';

class ValidationManager {
  ValidationManager._();
  static final instance = ValidationManager._();

  /*
  r'^
  (?=.*[A-Z])       // should contain at least one upper case
  (?=.*[a-z])       // should contain at least one lower case
  (?=.*?[0-9])      // should contain at least one digit
  (?=.*?[!@#\$&*~]) // should contain at least one Special character  
$   */
  String patternMobile = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  String patternPassword =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~+-/-_])';

  String? validateMobile(String? value) {
    RegExp regExp = RegExp(patternMobile);
    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || !EmailValidator.validate(value)) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }

  String? validateName(String? value) {
    if (value == null || value.length < 3) {
      return 'Name must be more than 2 charater';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    RegExp regex = RegExp(patternPassword);
    if (value == null || value.length < 6) {
      return 'Min 6 character.';
    } else {
      if (!regex.hasMatch(value)) {
        return 'At least one Upper, Lower Case, Digit and Special Chara. ';
      } else {
        return null;
      }
    }
  }
}
