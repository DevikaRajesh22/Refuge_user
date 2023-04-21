String getAge(DateTime dateOfBirth) {
  final today = DateTime.now();
  int age = today.year - dateOfBirth.year;
  if (today.month < dateOfBirth.month ||
      (today.month == dateOfBirth.month && today.day < dateOfBirth.day)) {
    age--;
  }
  return age.toString();
}
