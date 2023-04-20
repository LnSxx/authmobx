String? validatePassword(String value) {
  value = value.trim();

  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  final RegExp digitRegex = RegExp(r'\d');
  if (!digitRegex.hasMatch(value)) {
    return 'Password must contain at least one number';
  }

  return null;
}

String? validatePasswordCheckLengthOnly(String value) {
  value = value.trim();

  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  return null;
}
