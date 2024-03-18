import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:regexpattern/regexpattern.dart';

bool containsElementOfList(String? element, List<String?>? list) {
  // If the list is null or empty, return true
  if (list == null || list.isEmpty) {
    return true;
  }

  // If the element is not null and the list contains the element, return true
  return element != null && list.contains(element);
}

String? Function(String?)? firstNameValidator() {
  return FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "First name is required"),
    FormBuilderValidators.maxWordsCount(1, errorText: "Should not contain spaces"),
    FormBuilderValidators.minLength(3, errorText: "Should exceed 3 characters"),
    FormBuilderValidators.maxLength(8, errorText: "Should be within 8 characters"),
    (String? value) {
      if (value != null) {
        if (RegExp(r'^[0-9]+$').hasMatch(value)) {
          return "Should not be only numbers";
        }
        if (!RegExp(RegexPattern.usernameInstagram).hasMatch(value)) {
          return "Only '_' characters supported";
        }
      }
      return null;
    },
  ]);
}


String? Function(String?)? lastNameValidator() {
  String? Function(String?)? validator = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "last name is required"),
    FormBuilderValidators.maxWordsCount(1,
        errorText: "Should not contain spaces"),
    FormBuilderValidators.minLength(3, errorText: "Should exceed 5 characters"),
    FormBuilderValidators.maxLength(8,
        errorText: "Should be within 8 characters"),
    (e) {
      String pattern = r'^[0-9]+$';
      return RegExp(pattern).hasMatch(e!) ? "Should not be only numbers" : null;
    },
    (e) {
      String pattern = RegexPattern.usernameInstagram;
      return RegExp(pattern).hasMatch(e!)
          ? null
          : "Only '_' characters supported";
    },
  ]);
  return validator;
}

//validations
String? Function(String?)? emailValidator() {
  String? Function(String?)? validator = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "E-mail is required"),
    FormBuilderValidators.email(errorText: "Enter a valid email address"),
  ]);
  return validator;
}

//validations
String? Function(String?)? passwordValidator() {
  String? Function(String?)? validator = FormBuilderValidators.compose([
    FormBuilderValidators.required(errorText: "Password is required"),
    FormBuilderValidators.minLength(5,
        errorText: "minimum of five (5) characters allowed"),
    FormBuilderValidators.maxLength(8,
        errorText: "maximum of eight (8) characters allowed"),
    (e) {
      String pattern = r'^[0-9]+$';
      return RegExp(pattern).hasMatch(e!) ? "Should not be only numbers" : null;
    },
  ]);
  return validator;
}
