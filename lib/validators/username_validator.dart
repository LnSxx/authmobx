String? validateUsername(String value) {
  value = value.trim();

  if (value.length < 3) {
    return 'Username must be at least 3 characters long';
  }

  if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
    return 'Username must contain only letters, numbers, and underscores';
  }

  return null;
}
