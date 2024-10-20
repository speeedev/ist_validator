import 'package:ist_validator/constants/validation_messages.dart';
import 'package:ist_validator/constants/validation_patterns.dart';
import 'package:ist_validator/modules/validator_rule.dart';

class IstFormValidator {
  static String? validateEmail(String? value,
      {String emptyMessage = ValidationMessages.requiredField,
      String invalidMessage = ValidationMessages.invalidEmail}) {
    if (value == null || value.isEmpty) {
      return emptyMessage;
    }
    if (!RegExp(ValidationPatterns.emailPattern).hasMatch(value)) {
      return invalidMessage;
    }
    return null;
  }

  static String? customValidate(String value,
      {List<FormValidatorRule> rules = const []}) {
    assert(value.isNotEmpty, 'Value cannot be empty');
    assert(rules.isEmpty, 'Rules list cannot be null');
    for (var rule in rules) {
      final result = rule.validate(value);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}
