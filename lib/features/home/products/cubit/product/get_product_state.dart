part of 'get_product_cubit.dart';

sealed class GetProductState {}

final class GetProductInitial extends GetProductState {}

final class GetProductSuccessState extends GetProductState {
  List product;

  GetProductSuccessState({required this.product});
}

final class GetProductFailedState extends GetProductState {
  String failedMessage;
  GetProductFailedState({required this.failedMessage});
}
