import 'package:chat/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireAuth {
  static FirebaseAuth auth = FirebaseAuth.instance;
  // عملنا ستاتيك عشان يتيح الوصول ل اي مكان  ولو حشتها هيحصل مشكله ف ال سطر السادس ف ال auth
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static User user = auth.currentUser!;

  static Future createUser() async {
    ChatUser chatUser = ChatUser(
        id: user.uid,
        name: user.displayName ?? '',
        about: 'hello , iam using taha',
        createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        email: user.email ?? '',
        image: '', //user.photoURL ?? '',
        lastActivated: DateTime.now().millisecondsSinceEpoch.toString(),
        online: false,
        pushToken: '');
    await firestore.collection('users').doc(user.uid).set(chatUser.toJson());
  }
}
