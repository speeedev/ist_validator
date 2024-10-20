class ValidationMessages {
  static const String requiredField = 'This field is required';
  static const String invalidEmail = 'Invalid email';

  static String maxLength(int maxLength) {
    return 'Maximum length is $maxLength characters';
  }

  static String minLength(int minLength) {
    return 'Minimum length is $minLength characters';
  }
}