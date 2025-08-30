// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:fpdart/src/either.dart';


import 'package:taskelevate/data/datasource/remotedata.dart';

import 'package:taskelevate/domain/entity/productentity.dart';
import 'package:taskelevate/domain/repository/domainrepository.dart';

class Datarepositoryimp implements Domainrepository {
  RemoteData remoteData;
  Datarepositoryimp({required this.remoteData});
  @override
  Future<Either<String, List<ProductEntity>>> fetchData() async {
    try {
      final response = await remoteData.fetchData();
      return right(response);
    } catch (e) {
      return left(e.toString());
    }
  }
}
