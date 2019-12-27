
class Validation {

  static String emailValidate (String email) {
    if(email.isEmpty){
      return 'Email is required';
    }
    if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)){
      return 'Wrong Email';
    }
    return null;
  }

  static String passwordValidate (String pass){
    if(pass.isEmpty){
      return 'Password is required';
    }
    return null;
  }

  static String phoneValidate (String num) {
    if(num.isEmpty){
      return 'Phone Number is required';
    }
    return null;
  }

  static String usernameValidate (String pass){
    if(pass.isEmpty){
      return 'Username is required';
    }
    return null;
  }
}
