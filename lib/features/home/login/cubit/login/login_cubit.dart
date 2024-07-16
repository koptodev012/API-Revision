import 'package:api_revision/common/variables.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // Function to get a list of products
  void postLoginFunction(String email, String password) async {
    emit(LoginLoadingState());
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

      final response = await dio.post(CommonVariables.loginUrl,
          data: {"email": email, "password": password});

      if (response.statusCode == 200) {
        if (password == "pistol") {
          emit(LoginSuccessState());
        } else {
          emit(LoginFailedState(errorMessage: "Login Failed"));
        }
      }
    } catch (e) {
      emit(LoginFailedState(errorMessage: "Login Failed"));
    }
  }
}
