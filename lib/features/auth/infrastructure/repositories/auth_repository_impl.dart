import 'package:teslo_app_z/features/auth/domain/domain.dart';
import 'package:teslo_app_z/features/auth/infrastructure/infrastructure.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl({AuthDatasource? datasource})
    : datasource = datasource ?? AuthDataSourceImpl();

  @override
  Future<User> checkAuthStatus(String token) {
    return datasource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return datasource.login(email, password);
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    return datasource.register(email, password, fullName);
  }
}
