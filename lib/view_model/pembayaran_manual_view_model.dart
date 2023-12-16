import 'dart:developer';

import 'package:empathi_care/model/services/pembayaran_manual_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PembayaranManualProvider extends ChangeNotifier {
  String fileImage = "";
  bool isLoading = false;
  PembayaranManualService pembayaranManualService = PembayaranManualService();

  void init() async {
    final pref = await SharedPreferences.getInstance();

    await pref.setString('token',
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDI1ODk2NjgsImlhdCI6MTcwMjU4NjA2OCwiaWQiOjIyLCJyb2xlIjoiRG9jdG9yIiwic3RhdHVzIjoiQWN0aXZlIn0.OzReou9MAt0hs519C_8NpihjCxC__mte4DNGAjRWjCs");

    log(pref.getString("token").toString());
  }

  Future<bool> addTransaction() async {
    try {
      Map<String, dynamic> params = {
        // "user_id": "2",
        "price_method": "180000",
        "price_counseling": "50000",
        "price_duration": "45000",
        "payment_type": "manual",
        "doctor_id": "4",
      };
      final response = await pembayaranManualService.addTransaction(fileImage, params);

      if (response != null) {
        log(response.toString());
        return true;
      } else {
        log(response.toString());
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  void showDialogImagePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(8),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  _imageSelector("camera", context);
                },
                child: const ListTile(
                  leading: Icon(Icons.camera),
                  title: Text("Kamera"),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  _imageSelector("gallery", context);
                },
                child: const ListTile(
                  leading: Icon(Icons.folder),
                  title: Text("Galeri"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future _imageSelector(String pickerType, BuildContext context) async {
    XFile? imageFile;
    switch (pickerType) {
      case "gallery":
        try {
          imageFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 100);
        } catch (e) {
          PermissionStatus permission = await Permission.storage.status;
          if (permission == PermissionStatus.denied) {
            //? Requesting the permission
            PermissionStatus statusDenied = await Permission.storage.request();
            if (statusDenied.isPermanentlyDenied) {
              //? permission isPermanentlyDenied
              // ignore: use_build_context_synchronously
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Perhatian!",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        const Text("Aplikasi memerlukan beberapa izin untuk dapat berjalan dengan baik. Apakah anda ingin mengaktifkannya?"),
                      ],
                    ),
                    actions: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Batal",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Pengaturan",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }
        }

        break;

      case "camera":
        try {
          imageFile = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 80);
        } catch (e) {
          PermissionStatus permission = await Permission.camera.status;
          if (permission == PermissionStatus.denied) {
            //? Requesting the permission
            PermissionStatus statusDenied = await Permission.camera.request();
            if (statusDenied.isPermanentlyDenied) {
              //? permission isPermanentlyDenied
              // ignore: use_build_context_synchronously
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Perhatian!",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        const Text("Aplikasi memerlukan beberapa izin untuk dapat berjalan dengan baik. Apakah anda ingin mengaktifkannya?"),
                      ],
                    ),
                    actions: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Batal",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Pengaturan",
                          style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          }
        }

        break;
    }

    if (imageFile != null) {
      log("You selected  image : ${imageFile.path}");
      fileImage = imageFile.path;
      notifyListeners();
    } else {
      log("You have not taken image");
    }
  }

  void onTapRemove() {
    fileImage = "";
    notifyListeners();
  }
}
