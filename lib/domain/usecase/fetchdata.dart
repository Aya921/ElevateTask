// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:taskelevate/domain/entity/productentity.dart';
import 'package:taskelevate/domain/repository/domainrepository.dart';

class FetchdataUsecase {
  Domainrepository domainrepository;
  FetchdataUsecase({required this.domainrepository});

  Future<Either<String, List<ProductEntity>>> call() async {
    return await domainrepository.fetchData();
  }
}
