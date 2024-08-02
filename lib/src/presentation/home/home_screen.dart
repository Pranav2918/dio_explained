import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_explained/src/domain/network_service/app_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? selectedImage;
  bool _isLoading = false;
  final AppRepository _appRepository = AppRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: () async {
              ImagePicker imagePicker = ImagePicker();
              XFile? file =
                  await imagePicker.pickImage(source: ImageSource.camera);
              if (file != null) {
                selectedImage = File(file.path);
                setState(() {});
                print("Selected Images $selectedImage");
              }
            },
            child: selectedImage == null
                ? Container(
                    height: 200.0,
                    margin: const EdgeInsets.only(bottom: 50.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12.0)),
                    child: const Text("Upload Image"),
                  )
                : Container(
                    height: 200.0,
                    margin: const EdgeInsets.only(bottom: 50.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        image: DecorationImage(
                            image: kIsWeb
                                ? NetworkImage(selectedImage!.path)
                                : FileImage(selectedImage!),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
          ),
          ElevatedButton(
              onPressed: () async {
                if (selectedImage != null) {
                  setState(() {
                    _isLoading = true;
                  });
                  FormData formData = FormData.fromMap({
                    'file': await MultipartFile.fromFile(selectedImage!.path, filename: "bobomedia")
                  });
                  _appRepository.uploadSelectedImage(formData).then(
                    (value) {
                      debugPrint("Location => ${value.location}");
                      setState(() {
                        _isLoading = false;
                      });
                    },
                  ).onError(
                    (error, stackTrace) {
                      debugPrint("Err $error");
                    },
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Select Image")));
                }
              },
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Upload"))
        ],
      ),
    );
  }
}
