// ignore_for_file: file_names

mixin FormValidators {
  String? isNotEmpty(String? value, {String? message}) =>
      value!.isEmpty ? message ?? "Este campo é obrigatório" : null;

  String? combine(
    List<String? Function()> validators,
  ) {
    for (final element in validators) {
      final validation = element();
      if (validation != null) return validation;
    }
    return null;
  }
}
