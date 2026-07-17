import 'package:Expenza/features/auth/data/models/user.dart';

abstract class BaseAuthState{}

class BaseAuthLoading extends BaseAuthState{}
class BaseAuthSuccess extends BaseAuthState{
  BaseAuthSuccess(this.user);
  User user;
}
class BaseAuthError extends BaseAuthState{}