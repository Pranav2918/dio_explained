import 'package:dio_explained/src/domain/network_service/dio_helper.dart';

class AppRepository {
  static final DioHelper _dioHelper = DioHelper();

  Future<dynamic> demoPostApi(Object requestModel) async {
    var response = await _dioHelper.post(
        url: "https://reqres.in/api/login",
        isAuthRequired: false,
        requestBody: requestModel);
    return response; //Change according to your response (For model = i.e. Model.fromJson(response), and give returnType to your model instead of dynamic)
  }

  Future<ImageUploadResponse> uploadSelectedImage(Object requestModel) async {
    var response = await _dioHelper.multipartPost(
        url: "https://api.escuelajs.co/api/v1/files/upload",
        requestBody: requestModel);
    return ImageUploadResponse.fromJson(response);
  }
}

class ImageUploadResponse {
  final String originalName;
  final String fileName;
  final String location;

  ImageUploadResponse(
      {required this.originalName,
      required this.fileName,
      required this.location});

  factory ImageUploadResponse.fromJson(Map<String, dynamic> json) =>
      ImageUploadResponse(
          originalName: json['originalname'],
          fileName: json['filename'],
          location: json['location']);
}
