// import 'dart:io';

// import 'package:chat/firebase/fire_database.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';

// class FireStorage {
//   final FirebaseStorage fireStorage = FirebaseStorage.instance;
//   Future sendImage({required File file,required String roomId,required String uid}) async {
//     String ext = file.path.split('.').last;

//     final ref = fireStorage
//         .ref()
//         .child('images/$roomId/${DateTime.now().microsecondsSinceEpoch}.$ext');

//     ref.putFile(file);
//     String imageUrl = await ref.getDownloadURL();
//     // debugPrint(imageUrl);
//     FireData().sendMessage(uid, imageUrl , roomId , type: 'image');
//   }
// }



import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FireStorage {
  final FirebaseStorage fireStorage = FirebaseStorage.instance;

  Future<String?> sendImage({required File file,required String roomId,required String uid}) async {
    try {
      String ext = file.path.split('.').last;
      final ref = fireStorage
          .ref()
          .child('images/$roomId/${DateTime.now().microsecondsSinceEpoch}.$ext');
      
      // Upload the file
      await ref.putFile(file);

      // Get the download URL
      String imageUrl = await ref.getDownloadURL();
      debugPrint('Image URL: $imageUrl');
      return imageUrl;
    } catch (e) {
      debugPrint('Error uploading image: $e');
      return null;
    }
  }
}
