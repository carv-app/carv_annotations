/// The enum specifying the type of validation supported.
enum ValidatorType {
  required,
  email,
  minLength,
  maxLength,
  min,
  max,
}

/// The class object specifying how to validate.
class Validator {
  /// Validator name
  final ValidatorType type;

  /// Matcher for the validator. This is optional
  final dynamic matcher;

  const Validator(this.type, {this.matcher});
}

/// The class object specifying a validation rule for a field.
///
/// usage:
/// ```dart
/// @ModelValidate([
/// Validatable('name', Validator(ValidatorType.required)),
/// Validatable('email', Validator(ValidatorType.email)),
/// ...
/// ])
class Validatable {
  /// The name of the field to validate
  final String name;

  /// The validator to use
  final Validator validator;

  /// If the message to show when the validation fails needs to be customized,
  final String? message;

  const Validatable(this.name, this.validator, {this.message});
}

/// The annotation specifying the validators for a model.
///
/// usage:
/// ```dart
/// @ModelValidate([
///  Validatable('name', Validator(ValidatorType.required)),
///  Validatable('email', Validator(ValidatorType.email)),
///  Validatable('password', Validator(ValidatorType.minLength, matcher: 8)),
///  Validatable('password', Validator(ValidatorType.maxLength, matcher: 16)),
///  Validatable('age', Validator(ValidatorType.min, matcher: 18)),
///  Validatable('age', Validator(ValidatorType.max, matcher: 60)),
/// ])
/// class ExampleModel {
/// ...
/// }
class ModelValidate {
  /// The list of validators for the model
  final List<Validatable> validators;

  const ModelValidate(
    this.validators,
  );
}
