String? alphaNumericValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  final RegExp nameExp = RegExp(r'^[a-zA-Z0-9,\n ]+$');
  if (!nameExp.hasMatch(value)) {
    return 'Please enter only alphanumeric characters';
  }
  return null;
}

String? numericValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  final RegExp nameExp = RegExp(r'^[0-9]+$');
  if (!nameExp.hasMatch(value)) {
    return 'Please enter only numeric characters';
  }
  return null;
}

String? decimalValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  final RegExp nameExp = RegExp(r'^\d+(\.\d+)?$');
  if (!nameExp.hasMatch(value)) {
    return 'Please enter a valid number';
  }
  return null;
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  final RegExp emailExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!emailExp.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  return null;
}

String? confirmPasswordValidator(String? value, String? password) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  if (value != password) {
    return 'Passwords do not match';
  }
  return null;
}

String? phoneValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  final RegExp phoneExp = RegExp(r'^\d{10}$');
  if (!phoneExp.hasMatch(value)) {
    return 'Please enter a valid 10-digit phone number';
  }
  return null;
}
