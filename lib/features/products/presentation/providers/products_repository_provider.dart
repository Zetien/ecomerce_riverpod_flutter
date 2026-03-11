
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_app_z/features/auth/presentation/providers/auth_provider.dart';
import 'package:teslo_app_z/features/products/domain/domain.dart';
import 'package:teslo_app_z/features/products/infrastructure/infraestructure.dart';


final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  final accessToken = ref.watch(authProvider).user?.token ?? '';

  final productsRepository = ProductsRepositoryImpl(
    ProductsDatasourceImpl( accessToken:accessToken),
  );
  return productsRepository;
  
});