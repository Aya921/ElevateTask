import 'package:fpdart/fpdart.dart';
import 'package:taskelevate/domain/entity/productentity.dart';

abstract interface class Domainrepository {
  Future<Either<String,List<ProductEntity>>> fetchData();

}