import 'package:ist_validator/modules/validator_rule.dart';

class IstValidator {
  /// Validates email address using [EmailFormatRule].
  /// Returns `true` if email is valid, otherwise `false`.
  /// Example:
  /// ```dart
  /// IstValidator.validateEmail("hi@spee.dev"); // true
  /// IstValidator.validateEmail("hi@spee"); // false
  /// IstValidator.validateEmail("hi@spee."); // false
  /// ```
  static bool validateEmail(String email) {
    return EmailFormatRule().validate(email) == null;
  }

  /// Validates if the value is not empty using [RequiredRule].
  /// Returns `true` if value is not empty, otherwise `false`.
  /// Example:
  /// ```dart
  /// IstValidator.validateNotEmpty("hello"); // true
  /// IstValidator.validateNotEmpty(""); // false
  /// ```
  static bool validateIsNotEmpty(String value) {
    return RequiredRule().validate(value) == null;
  }

  /// Validates if the value matches the max length using [MaxLengthRule].
  /// Returns `true` if the value is within the max length, otherwise `false`.
  /// Example:
  /// ```dart
  /// IstValidator.validateMaxLength("hello", 10); // true
  /// IstValidator.validateMaxLength("helloooooo", 5); // false
  /// ```
  static bool validateMaxLength(String value, int maxLength) {
    return MaxLengthRule(maxLength).validate(value) == null;
  }

  /// Validates if the value matches the min length using [MinLengthRule].
  /// Returns `true` if the value is at least the min length, otherwise `false`.
  /// Example:
  /// ```dart
  /// IstValidator.validateMinLength("hello", 3); // true
  /// IstValidator.validateMinLength("hi", 5); // false
  /// ```
  static bool validateMinLength(String value, int minLength) {
    return MinLengthRule(minLength).validate(value) == null;
  }

  /// Validates if the value is a number.
  /// Returns `true` if value is a number, otherwise `false`.
  /// Example:
  /// ```dart
  /// IstValidator.validateNumber(123); // true
  /// IstValidator.validateNumber("123"); // true
  /// IstValidator.validateNumber("123.45"); // true
  /// IstValidator.validateNumber("hello"); // false
  /// ```
  static bool validateNumber(String value) {
    return double.tryParse(value) != null;
  }

  /// Validates if the password and confirm password are the same.
  /// Returns `true` if password and confirm password are the same, otherwise `false`.
  /// Example:
  /// ```dart
  /// IstValidator.confirmPassword("password", "password"); // true
  /// IstValidator.confirmPassword("password", "password123"); // false
  /// ```
  static bool confirmPassword(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  /// Allows custom validation logic with a callback function.
  /// Returns `true` if the custom validation passes, otherwise `false`.
  /// Example:
  /// ```dart
  /// IstValidator.customValidation("hello", (value) => value.length > 3); // true
  /// ```
  static bool customValidation(String value, Function(String) validation) {
    return validation(value);
  }
}
