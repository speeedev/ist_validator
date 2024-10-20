import 'package:flutter_test/flutter_test.dart';
import 'package:ist_validator/validators/validator.dart';

void main() {
  // Test for validateEmail method
  test('Validate email', () {
    expect(IstValidator.validateEmail("hi@spee.dev"), true);
    expect(IstValidator.validateEmail("hi@spee."), false);
    expect(IstValidator.validateEmail("hi@spee"), false);
    expect(IstValidator.validateEmail("test@domain.com"), true);
    expect(IstValidator.validateEmail("test@domain.c"), false);
    expect(IstValidator.validateEmail("invalid@@domain.com"), false);
  });

  // Test for validateNotEmpty method
  test('Validate not empty', () {
    expect(IstValidator.validateIsNotEmpty("hello"), true);
    expect(IstValidator.validateIsNotEmpty(""), false);
    expect(IstValidator.validateIsNotEmpty("   "), false); // Only spaces
  });

  // Test for validateNumber method
  test('Validate number', () {
    expect(IstValidator.validateNumber("123"), true); // Integer string
    expect(IstValidator.validateNumber("123.45"), true); // Decimal string
    expect(IstValidator.validateNumber("-123.45"), true); // Negative number string
    expect(IstValidator.validateNumber("0"), true); // Zero
    expect(IstValidator.validateNumber("hello"), false); // Non-number string
    expect(IstValidator.validateNumber("123abc"), false); // Alphanumeric
    expect(IstValidator.validateNumber(""), false); // Empty string
  });

  // Test for validateMaxLength method
  test('Validate max length', () {
    expect(IstValidator.validateMaxLength("hello", 10), true); // Within max length
    expect(IstValidator.validateMaxLength("helloooooo", 5), false); // Exceeds max length
    expect(IstValidator.validateMaxLength("", 5), true); // Empty string
  });

  // Test for validateMinLength method
  test('Validate min length', () {
    expect(IstValidator.validateMinLength("hello", 3), true); // At least min length
    expect(IstValidator.validateMinLength("hi", 5), false); // Below min length
    expect(IstValidator.validateMinLength("", 5), false); // Empty string
  });
}
