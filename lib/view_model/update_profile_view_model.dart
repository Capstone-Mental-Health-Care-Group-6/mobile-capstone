import 'dart:io';

import 'package:dio/dio.dart';
import 'package:empathi_care/model/services/update_profile_services.dart';
import 'package:empathi_care/model/update_profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileViewModel extends ChangeNotifier {
  UpdateProfileService updateProfileService = UpdateProfileService();
  UpdateProfileModel? updateProfileModel;
  DateTime? newBirthDate;
  File? newavatar;
  String? newavatarString;
  final ImagePicker _image = ImagePicker();

  Future updateProfile({
    String? newname,
    String? newemail,
    String? newphone,
    String? newbirth,
    String? newgender,
  }) async {
    try {
      updateProfileModel = await updateProfileService.updateProfile(
        name: newname,
        email: newemail,
        phone: newphone,
        birhtDate: newbirth,
        gender: newgender,
        newavatar: newavatarString,
      );

      notifyListeners();
    } catch (e) {
      if (e is DioException) {
        rethrow;
      }
    }
  }

  Future pickFile() async {
    final XFile? image = await _image.pickImage(source: ImageSource.gallery);
    if (image != null) {
      newavatar = File(image.path);
      newavatarString = image.path;
    }
    notifyListeners();
    return image;
  }

  void removeFile() {
    newavatar = null;
    notifyListeners();
  }
}
