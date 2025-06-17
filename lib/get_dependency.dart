import 'package:get_it/get_it.dart';
import 'package:taskelevate/data/datasource/remotedata.dart';
import 'package:taskelevate/data/repository/datarepositoryimp.dart';
import 'package:taskelevate/domain/repository/domainrepository.dart';
import 'package:taskelevate/domain/usecase/fetchdata.dart';
import 'package:taskelevate/presentaion/cubit/products_cubit.dart';

final serverLocator = GetIt.instance;
Future<void> init_dependency() async {
  serverLocator.registerFactory<RemoteData>(() => RemoteDataimp());
  serverLocator.registerFactory<Domainrepository>(
    () => Datarepositoryimp(remoteData: serverLocator()),
  );
   serverLocator.registerFactory(
    () => FetchdataUsecase(domainrepository: serverLocator()),
  );
   serverLocator.registerFactory(
    () => ProductsCubit(fetchdatainfo: serverLocator()),
  );
}
