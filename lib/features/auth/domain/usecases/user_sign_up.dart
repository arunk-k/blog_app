import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UserCase<String,UserSignParams>{
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);
  @override
  Future<Either<Failure, String>> call(UserSignParams params) async{
    return await authRepository.signUpWithEmailPassword(name: params.name, email: params.email, password: params.password);
    // TODO: implement call
    throw UnimplementedError();
  }

}
class UserSignParams{
  final String email;
  final String password;
  final String name;
  UserSignParams({
    required this.email,
    required this.password,
    required this.name
});
}