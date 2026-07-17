import 'package:Expenza/core/data_clients/hive_client.dart';
import 'package:Expenza/core/utils/constants/strings.dart';
import 'package:Expenza/features/auth/data/models/user.dart' as u;
import 'package:Expenza/features/auth/presentation/cubits/base_auth/base_auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseAuthCubit extends Cubit<BaseAuthState> {
  BaseAuthCubit() : super(BaseAuthLoading());

  Future<void> loadUser() async {
    //await Future.delayed(Duration(milliseconds: 250));
    u.User user = u.User(
      firstName: 'Ziad',
      lastName: 'Hegazy',
      email: 'ziadhegazy2003@gmail.com',
      password: 'test',
      sessionToken: 'token123',
      signInMethod: u.SignInMethod.standard,
    );
    emit(
      BaseAuthSuccess(
        user,
      ),
    );
    await HiveClient().put(user.toMap(), USER_BOX);
  }
}
