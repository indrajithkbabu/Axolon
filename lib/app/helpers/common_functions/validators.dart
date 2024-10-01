class ValidatorHelper {
  ValidatorHelper();
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static String? validateMobile(String? value) {
    const pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    final regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Please enter the mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    const pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    final regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validateGroup(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter group';
    }
    return null;
  }
}
