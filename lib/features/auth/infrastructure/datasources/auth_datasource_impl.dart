import 'package:dio/dio.dart';
import 'package:teslo_app_z/config/config.dart';
import 'package:teslo_app_z/features/auth/domain/domain.dart';
import 'package:teslo_app_z/features/auth/infrastructure/infrastructure.dart';


class AuthDataSourceImpl extends AuthDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));
  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401){
        throw CustomError(e.response?.data['message'] ?? 'Credenciales incorrectas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar coneccion de internet');
      }

      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<User> register(String email, String password, String fullName) async {
    try {
      final response = await dio.post(
        '/auth/register',
        data: {'email': email, 'password': password, 'fullName': fullName},
      );

      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400){
        throw CustomError(e.response?.data['message'] ?? 'Error al registrar usuario');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar coneccion de internet');
      }

      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}
