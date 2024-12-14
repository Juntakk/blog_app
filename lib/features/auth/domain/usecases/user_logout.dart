import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/useCase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogoutUserUseCase implements UseCase<void, NoParams> {
  final SupabaseClient supabaseClient;

  LogoutUserUseCase(this.supabaseClient);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    try {
      await supabaseClient.auth.signOut();
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
