import 'package:dio_explained/src/domain/network_service/dio_handler.dart';

class AppRepository {
  static final DioHelper _dioHelper = DioHelper();

  Future<dynamic> demoPostApi(Object requestModel) async {
    var response = await _dioHelper.post(
        url: "https://reqres.in/api/login",
        isAuthRequired: false,
        requestBody: requestModel);
    return response; //Change according to your response (For model = i.e. Model.fromJson(response), and give returnType to your model instead of dynamic)
  }
}
