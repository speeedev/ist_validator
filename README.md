A versatile validator package for form validation and general use in Dart and Flutter projects. It provides simple and reusable validation rules that can be used in forms or other input validation scenarios.

## Features

- **Form Validation**: Easy-to-use validation rules for forms, including required fields, email validation, and password confirmation.
- **Custom Validation**: Define your own validation rules with simple callback functions.

## Getting started

To start using the `ist_validator` package, you need to add it to your `pubspec.yaml` file.

1. Add the following dependency:

```yaml
dependencies:
  ist_validator: latest_version
```

Install the package:

`flutter pub get`

Import the package in your Dart code:

`import 'package:ist_validator/ist_validator.dart';`

## Usage

### Basic Example with IstValidator

Here is an example of how to use IstValidator to validate email input in a form:

```dart
bool isValidEmail = IstValidator.validateEmail("example@gmail.com");
print(isValidEmail); // true

bool isNotEmpty = IstValidator.validateIsNotEmpty("Hello");
print(isNotEmpty); // true

bool isValidLength = IstValidator.validateMaxLength("hello", 10);
print(isValidLength); // true

bool hasMinLength = IstValidator.validateMinLength("hi", 5);
print(hasMinLength); // false

bool isNumber = IstValidator.validateNumber("123.45");
print(isNumber); // true

bool passwordsMatch = IstValidator.confirmPassword("password", "password");
print(passwordsMatch); // true
```

### Basic Example with IstFormValidator

```dart
import 'package:flutter/material.dart';
import 'package:ist_validator/ist_validator.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Global key to identify the form
  final _formKey = GlobalKey<FormState>();

  // Controllers to get the values of the text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ist Form Validator Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Assign the form key
            child: Column(
              children: [
                // Name TextField
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => IstFormValidator.customValidate(
                    value!,
                    rules: [
                      RequiredRule(),
                      MinLengthRule(3),
                      MaxLengthRule(15),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Surname TextField
                TextFormField(
                  controller: _surnameController,
                  decoration: const InputDecoration(
                    labelText: 'Surname',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => IstFormValidator.customValidate(
                    value!,
                    rules: [
                      RequiredRule(),
                      MinLengthRule(3),
                      MaxLengthRule(15),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Email TextField
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => IstFormValidator.customValidate(
                    value!,
                    rules: [
                      RequiredRule(),
                      EmailFormatRule(),
                      MinLengthRule(3),
                      MaxLengthRule(50),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Password TextField
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) => IstFormValidator.customValidate(
                    value!,
                    rules: [
                      RequiredRule(),
                      MinLengthRule(6),
                      MaxLengthRule(15),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, show a snackbar or proceed
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Form is valid!')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```