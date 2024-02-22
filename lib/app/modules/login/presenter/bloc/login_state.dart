class SignInState{
  SignInState init(){
    return SignInState();
  }

  SignInState clone(){
    return SignInState();
  }
}

class NewUserState extends SignInState{}

class LoginLoading extends SignInState{}