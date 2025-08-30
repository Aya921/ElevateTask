part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductLoding extends ProductsInitial {}

final class ProductSucess extends ProductsInitial {
  final List<ProductEntity> productEntity;
  ProductSucess(this.productEntity);
}

final class ProductLFailed extends ProductsInitial {
  final String messageFailed;
  ProductLFailed(this.messageFailed);
}
