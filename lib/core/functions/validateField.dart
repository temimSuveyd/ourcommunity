String? validateField({
  required String? value,
  required String fieldType,
  required int minWords, // now interpreted as minLetters
  required int maxWords, // now interpreted as maxLetters
}) {
  if (value == null || value.trim().isEmpty) {
    return 'حقل $fieldType لا يمكن أن يكون فارغاً';
  }

  final String trimmedValue = value.trim();
  final int charCount = trimmedValue.runes.length;

  // TEXT alanı için
  if (fieldType == 'text') {
    if (charCount < minWords) {
      return 'حقل $fieldType يجب أن يحتوي على الأقل $minWords حرف';
    }
    if (charCount > maxWords) {
      return 'حقل $fieldType يجب ألا يتجاوز $maxWords حرف';
    }
  }

  // EMAIL alanı için
  if (fieldType == 'email') {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(trimmedValue)) {
      return 'يرجى إدخال بريد إلكتروني صالح';
    }
  }

  // AGE alanı için
  if (fieldType == 'age') {
    if (!RegExp(r'^\d+$').hasMatch(trimmedValue)) {
      return 'يرجى إدخال عمر مكون من أرقام فقط';
    }
    final age = int.tryParse(trimmedValue);
    if (age == null || age < 0 || age > 120) {
      return 'يرجى إدخال عمر صحيح';
    }
  }

  // PASSWORD alanı için
  if (fieldType == 'password') {
    if (trimmedValue.length < 8) {
      return 'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل';
    }
    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(trimmedValue);
    final hasNumber = RegExp(r'\d').hasMatch(trimmedValue);
    if (!hasLetter || !hasNumber) {
      return 'يجب أن تحتوي كلمة المرور على حرف واحد على الأقل ورقم واحد على الأقل';
    }
  }

  // NAME alanı için
  if (fieldType == 'name') {
    final nameRegex = RegExp(r'^[\p{L} ]+$', unicode: true);
    if (!nameRegex.hasMatch(trimmedValue) || trimmedValue.length < 2) {
      return 'يرجى إدخال اسم صالح (الأحرف والمسافة فقط)';
    }
  }

  // NUMBER (sayılar) alanı için
  if (fieldType == 'number') {
    if (!RegExp(r'^\d+$').hasMatch(trimmedValue)) {
      return 'يرجى إدخال أرقام فقط لهذا الحقل';
    }
    if (charCount < minWords) {
      return 'حقل $fieldType يجب أن يحتوي على الأقل $minWords رقم';
    }
    if (charCount > maxWords) {
      return 'حقل $fieldType يجب ألا يتجاوز $maxWords رقم';
    }
  }

  // Diğer alanlar için
  if (fieldType != 'text' &&
      fieldType != 'name' &&
      fieldType != 'email' &&
      fieldType != 'age' &&
      fieldType != 'password' &&
      fieldType != 'number') {
    if (charCount < minWords) {
      return 'حقل $fieldType يجب أن يحتوي على الأقل $minWords حرف';
    }
    if (charCount > maxWords) {
      return 'حقل $fieldType يجب ألا يتجاوز $maxWords حرف';
    }
  }

  return null; // صالح
}
