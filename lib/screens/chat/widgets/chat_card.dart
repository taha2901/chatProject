import 'package:chat/models/room_model.dart';
import 'package:chat/models/user_model.dart';
import 'package:chat/screens/chat/chat_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final ChatRoom items;
  const ChatCard({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    String userId = items.member!
        .where((element) => element != FirebaseAuth.instance.currentUser!.uid)
        .first;
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ChatUser chatUser = ChatUser.fromJson(snapshot.data!.data()!);
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        roomId: items.id!,
                        chatUser: chatUser,
                      ),
                    ),
                  );
                },
                leading: const CircleAvatar(),
                title: Text(chatUser.name.toString()),
                subtitle: Text(
                    '${items.lastMessage == "" ? chatUser.about : items.lastMessage}'),
                trailing: 1 / 1 != 0
                    ? const Badge(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        label: Text("3"),
                        largeSize: 30,
                      )
                    : Text(items.lastMessageTime!),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
