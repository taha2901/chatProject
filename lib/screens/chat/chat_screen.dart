import 'package:chat/firebase/fire_database.dart';
import 'package:chat/models/msg_model.dart';
import 'package:chat/models/room_model.dart';
import 'package:chat/models/user_model.dart';
import 'package:chat/screens/chat/widgets/chat_message_card.dart';
import 'package:chat/screens/chat/widgets/field_msg_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ChatScreen extends StatefulWidget {
  final String roomId;
  final ChatUser chatUser;
  const ChatScreen({super.key, required this.roomId, required this.chatUser});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatUser.name!.toString()),
            Text(
              widget.chatUser.lastActivated!.toString(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.trash),
          ),
          IconButton(
            onPressed: () {
              
            },
            icon: const Icon(Iconsax.copy),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('rooms')
                      .doc(widget.roomId)
                      .collection('messages')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<MessageModel> messageItems = snapshot.data!.docs
                          .map((e) => MessageModel.fromJson(e.data()))
                          .toList()
                        ..sort(
                          (a, b) => b.createdAt!.compareTo(a.createdAt!),
                        );
                      return messageItems.isNotEmpty
                          ? ListView.builder(
                              reverse: true,
                              itemCount: messageItems.length,
                              itemBuilder: (context, index) {
                                return ChatMessageCard(
                                  messageModel: messageItems[index],
                                  index: index,
                                );
                              },
                            )
                          : Center(
                              child: GestureDetector(
                                onTap: () => FireData().sendMessage(
                                    widget.chatUser.id!,
                                    'Assalamu Alaikum 👋',
                                    widget.roomId),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "👋",
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium,
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          "Say Assalamu Alaikum",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            FieldMsgCard(
              chatUser: widget.chatUser,
              roomId: widget.roomId,
            ),
          ],
        ),
      ),
    );
  }
}
