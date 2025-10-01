class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    // يسمح فقط بحروف وأرقام، على الأقل 6 خانات
    final regex = RegExp(r'^[a-zA-Z0-9]{6,}$');
    return regex.hasMatch(password);
  }
}
