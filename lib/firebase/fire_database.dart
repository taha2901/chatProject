import 'package:chat/models/msg_model.dart';
import 'package:chat/models/room_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

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
          lastMessageTime: DateTime.now().millisecondsSinceEpoch.toString(),
          member: members,
          createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        );
        await firestore
            .collection('rooms')
            .doc(members.toString())
            .set(chatRoom.toJson());
      }
    }
  }

  Future sendMessage(
      String uid, String message, String roomId, {String? type}) async {
    String msgId = const Uuid().v1();
    MessageModel msg = MessageModel(
        id: msgId,
        fromId: myUid,
        msg: message,
        createdAt: DateTime.now().millisecondsSinceEpoch.toString(),
        read: "",
        toId: uid,
        type: type ?? 'text');
    await firestore
        .collection('rooms')
        .doc(roomId)
        .collection('messages')
        .doc(msgId)
        .set(msg.toJson());
  }
}
