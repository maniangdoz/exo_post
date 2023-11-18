class AppValidors {
  static String? emailValidtor(String? value) {
    if (value == null || value.isEmpty) {
      return "Email must not be empty";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
        .hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? passwordValidtor(String? value) {
    if (value == null || value.isEmpty) {
      return "Password must not be empty";
    }
    return null;
  }

  static String? nameValidtor(String? value) {
    if (value == null || value.isEmpty) {
      return "Name must not be empty";
    }
    return null;
  }

   static String? commentValidtor(String? value) {
    if (value == null || value.isEmpty) {
      return "Content must not be empty";
    }
    return null;
  }
}
