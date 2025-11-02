class Validation {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePasswordConfirmation({
    required String? confirmationValue,
    required String? originalPasswordValue,
  }) {
    // 1. Check for emptiness in the confirmation field
    if (confirmationValue == null || confirmationValue.isEmpty) {
      return 'Please confirm your password';
    }

    // 2. Check if the original password field is empty (should be validated separately)
    if (originalPasswordValue == null || originalPasswordValue.isEmpty) {
      return 'Original password is required first';
    }

    // 3. Check for exact match
    if (confirmationValue != originalPasswordValue) {
      return 'Passwords do not match';
    }

    // If both checks pass
    return null;
  }

  static String? validateName(String? value) {
    // 1. Check for emptiness
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    // 2. Check for minimum length (e.g., at least 2 characters)
    if (value.length < 2) {
      return 'Name must be at least 2 characters long';
    }

    // 3. Optional: Check for maximum length (e.g., no more than 50 characters)
    if (value.length > 50) {
      return 'Name cannot exceed 50 characters';
    }

    // 4. Optional: Check if the name contains only valid characters (letters, spaces, hyphens)
    // This Regex allows for letters (upper/lower case), spaces, hyphens, and apostrophes.
    final nameRegex = RegExp(r"^[a-zA-Z\s'-]+$");
    if (!nameRegex.hasMatch(value)) {
      return 'Name can only contain letters, spaces, hyphens, or apostrophes';
    }

    // If all checks pass
    return null;
  }


  static String? validateEgyptianPhoneNumber(String? value) {
    // 1. Check for emptiness
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Sanitize the input: remove spaces, hyphens, and any common country code prefix (+20 or 0020)
    String cleanValue = value.replaceAll(RegExp(r'[^\d]'), ''); // Keep only digits

    // Remove potential country code (+20 or 0020) if present at the start
    if (cleanValue.startsWith('0020')) {
      cleanValue = cleanValue.substring(4);
    } else if (cleanValue.startsWith('20')) {
      cleanValue = cleanValue.substring(2);
    }

    // Egyptian mobile numbers are 11 digits long and start with 010, 011, 012, or 015.
    // The structure is 01X XXXXXXXX (11 digits total).
    final phoneRegex = RegExp(r'^01[0125]\d{8}$');

    // 2. Check if it matches the valid format
    if (!phoneRegex.hasMatch(cleanValue)) {
      return 'Please enter a valid Egyptian mobile number (e.g., 01xxxxxxxxx)';
    }

    // 3. Optional: Check for exact length (after cleaning)
    if (cleanValue.length != 11) {
      return 'Phone number must be exactly 11 digits';
    }

    // If all checks pass
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    return null;
  }
}