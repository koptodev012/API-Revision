import 'dart:developer';
import 'package:api_revision/common/variables.dart';
import 'package:bloc/bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit() : super(GetProductInitial()) {
    getProductDataFunction();
  }

  // Function to get a list of products
  void getProductDataFunction() async {
    try {
      var dio = Dio();
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
      ));

      final response = await dio.get(CommonVariables.allProductsUrl);
      CommonVariables.allProductData = response.data["products"];

      if (response.statusCode == 200) {
        log("All product data --> ${CommonVariables.allProductData}");
        log("Perticular product data --> ${CommonVariables.allProductData[0]["id"]}");

        emit(GetProductSuccessState(product: CommonVariables.allProductData));
      }
    } catch (e) {
      emit(GetProductFailedState(failedMessage: e.toString()));
    }
  }
}
