import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:taskelevate/domain/entity/productentity.dart';
import 'package:taskelevate/domain/usecase/fetchdata.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final FetchdataUsecase _fetchdate;

  ProductsCubit({required FetchdataUsecase fetchdatainfo})
    : _fetchdate = fetchdatainfo,
      super(ProductsInitial());

  void getmyData() async {
    emit(ProductLoding());
    final res = await _fetchdate.call();
    res.fold(
      (l) {
        emit(ProductLFailed(l));
      },
      (r) {
        emit(ProductSucess(r));
      },
    );
  }
}
