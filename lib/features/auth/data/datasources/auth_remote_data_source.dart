import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/features/auth/data/models/user_model.dart';
import 'package:supabase/supabase.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> loginEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<UserModel> loginEmailPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: password,
        email: email,
        data: {
          'name': name,
        },
      );
      if (response.user == null) {
        throw const ServerException("User is null");
      }
      return UserModel.fromJson(
        response.user!.toJson(),
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
