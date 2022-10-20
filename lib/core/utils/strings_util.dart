class Strings {
  factory Strings() => _instance;
  Strings.internal();
  static final Strings _instance = Strings.internal();

  // text
  static const appTitle = 'Newspaper App';
  static const fontFamily = 'Poppins';
  static const noRouteDefinedFor = 'No route defined for';
  static const username = 'Username';
  static const password = 'Password';
  static const pleaseFillThisField = 'Please fill this field';
  static const loggingIn = 'Logging in...';
  static const admin = 'admin';
  static const loginFailed = 'Login failed, wrong username or password';

  // asset path
  static const appLogoPath = 'assets/images/app_logo.png';
}
