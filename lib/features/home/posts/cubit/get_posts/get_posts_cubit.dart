import 'dart:developer';
import 'package:api_revision/common/variables.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'get_posts_state.dart';

class GetPostsCubit extends Cubit<GetPostsState> {
  GetPostsCubit() : super(GetPostsInitial()) {
    getPostsDataFunction();
  }

  // Function to get a list of products
  void getPostsDataFunction() async {
    emit(GetPostsLoadingState());
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

      final response = await dio.get(CommonVariables.postsUrl);
      CommonVariables.postsData = response.data["posts"];
      var perticularData = response.data["posts"][0]["reactions"]["likes"];

      log("All Posts Data: ${CommonVariables.postsData}");
      log("Perticular Posts Data: $perticularData");

      if (response.statusCode == 200) {
        emit(GetPostsSuccessState(posts: CommonVariables.postsData));
      }
    } catch (e) {
      emit(GetPostsFailedState(failedMessage: e.toString()));
    }
  }
}
