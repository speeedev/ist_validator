// lib/modules/validation/validator_rule.dart

import 'package:ist_validator/constants/validation_messages.dart';
import 'package:ist_validator/constants/validation_patterns.dart';

abstract class FormValidatorRule {
  String? validate(String value);
}

class RequiredRule implements FormValidatorRule {
  @override
  String? validate(String value) {
    if (value.trim().isEmpty) {
      return ValidationMessages.requiredField;
    }
    return null;
  }
}

class EmailFormatRule implements FormValidatorRule {
  @override
  String? validate(String value) {
    if (!RegExp(ValidationPatterns.emailPattern).hasMatch(value)) {
      return ValidationMessages.invalidEmail;
    }
    return null;
  }
}

class MaxLengthRule implements FormValidatorRule {
  final int maxLength;

  MaxLengthRule(this.maxLength);

  @override
  String? validate(String value) {
    if (value.length > maxLength) {
      return ValidationMessages.maxLength(maxLength);
    }
    return null;
  }
}

class MinLengthRule implements FormValidatorRule {
  final int minLength;

  MinLengthRule(this.minLength);

  @override
  String? validate(String value) {
    if (value.length < minLength) {
      return ValidationMessages.minLength(minLength);
    }
    return null;
  }
}
