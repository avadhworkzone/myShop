/// REGULAR EXPRESSION
class RegularExpression {
  /// TextField Enter Pattern Expression
  static String emailPattern = r"([a-zA-Z0-9_@.])";
  static String passwordPattern = r"[a-zA-Z0-9#!_@$%^&*-]";
  static String passwordSpacePattern = r"^[^ ]*$";
  static String alphabetPattern = r"^[a-zA-Z]*$";
  static String alphabetSpacePattern = r"[a-zA-Z. ]";
  static String alphabetDigitSpacePattern = r"[a-zA-Z0-9#&$%_@.'?+ ]";
  static String alphabetDigitSpacePattern_ = r"[a-zA-Z0-9#&$%_@.'?+/ ]";
  static String alphabetDigitsPattern = r"[a-zA-Z0-9 ]";
  static String alphabetWithoutSpaceDigitsPattern = r"[a-zA-Z0-9]";
  static String alphabetDigitsSpacePlusPattern = r"[a-zA-Z0-9+ ]";
  static String alphabetDigitsSpecialSymbolPattern = r"[a-zA-Z0-9#&$%_@., ]";
  static String alphabetDigitsDashPattern = r"[a-zA-Z0-9- ]";
  static String addressValidationPattern = r"[a-zA-Z0-9-@#&* ]";
  static String digitsPattern = r"[0-9]";
  static String pricePattern = r'^\d+\.?\d*';

  /// Validation Expression Pattern
  static String emailValidationPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  // r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static String passwordValidPattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
}

/// ------------------------------------------------------------------- ///
/// VALIDATION MESSAGE WITH
class ValidationMsg {
  static String isRequired = "Field is required";
  static String passwordInValid = 'Password invalid';
  static String passwordLength = 'Password must be more than 6 char';
  static String passwordRemoveSpace = 'Remove your space';
  static String mobileNoLength = 'Mobile no must be 10 digit';
  static String somethingWentToWrong = "Something went wrong";
  static String pleaseEnterValidEmail = "Enter valid email";
  static String pleaseEnterValidDetails = "Enter valid detail";

  ///profile validation
  static String selectDob = 'Select date';
  static String pleaseEnterLastName = 'Enter last name';
  static String pleaseEnterCityName = 'Enter valid city';
  static String pleaseEnterFirstName = 'Enter first name';
  static String pleaseEnterStateName = 'Enter valid state';
  static String pleaseEnterAddress = 'Enter valid address';
  static String pleaseEnterCountryName = 'Enter valid country';
  static String passwordDoesNotMatch = 'Password does\'t match';
}
