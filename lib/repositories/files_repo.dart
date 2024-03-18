import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FilesRepo extends GetxController {
  FilesRepo get instance => Get.find();
  // Create a storage reference from our app
  final storageRef = FirebaseStorage.instance.ref();
 Future <String?> uploadImage(XFile image) async{
// Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref();
    final path = "images/${image.name}";
    final File imageFile = File(image.path);

// Create a reference to "mountains.jpg"
    final imageRef = storageRef.child(image.name);

// Create a reference to 'images/mountains.jpg'
    final imagesRef = storageRef.child(path);

// While the file names are the same, the references point to different files
    assert(imageRef.name == imagesRef.name);
    assert(imageRef.fullPath != imagesRef.fullPath);
    try {
      final TaskSnapshot uploadTask = await imagesRef.putFile(imageFile);
      String url = await uploadTask.ref.getDownloadURL();
      return url;
    } catch (e) {
      print(e);
    }
 return null;
  }
}
