import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:remind_me/models/user_address.dart';

class LocationRepo extends GetxController {
  static LocationRepo get instance => Get.find();
  dynamic errors;
  final _db = FirebaseFirestore.instance;
    
  updateUserLocationData(String userId, UserAddress? address)async{
      // if(address==null)return;
       await _db.collection("Users").doc(userId)
        //.collection("Location").doc(userId)
        .update({"address":address!.toJson()})
        .whenComplete(() async{
          await _db.collection("Users").doc(userId)
        .collection("Location").doc(userId)
         .set({"address":address.toJson()});
        })
        .catchError((e, stackTrace) => print(e));
        
  }
  
}