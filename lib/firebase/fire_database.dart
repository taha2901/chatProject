import 'package:chat/models/room_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireData {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String myUid = FirebaseAuth.instance.currentUser!.uid;
  Future createRoom(String email) async {
    QuerySnapshot userEmail = await firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    if (userEmail.docs.isNotEmpty) {
      String userId = userEmail.docs.first.id;
      List<String> members = [userId, myUid]..sort(
          (a, b) => a.compareTo(b),
        );

      QuerySnapshot roomExist = await firestore
          .collection('rooms')
          .where('member', isEqualTo: members)
          .get();

      if (roomExist.docs.isEmpty) {
        ChatRoom chatRoom = ChatRoom(
            id: members.toString(),
            lastMessage: "",
            lastMessageTime: DateTime.now().toString(),
            member: members,
            createdAt: DateTime.now().toString());
        await firestore
            .collection('rooms')
            .doc(members.toString())
            .set(chatRoom.toJson());
      }
    }
  }
}
